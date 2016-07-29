require 'net/http'
require 'uri'
require 'filesize'

module ESMDl
  class Download
    def initialize(release, with_doc = true, with_metadata = false)
      @release = release
      fetch download_url(@release['rlsArtifactsPath'], @release['rlsArtifactsFile']), @release['rlsArtifactsFile']
      fetch download_url(@release['rlsDocPath'], @release['rlsDocFile']), @release['rlsDocFile'] if with_doc
      fetch download_url(@release['rlsMetadataPath'], @release['rlsMetadataFile']), @release['rlsMetadataFile'] if with_metadata
    end

    def download_url(filepath, filename)
      url = "#{ESMDl.config.base_url}/releaseservices/Release?"
      url << "login=#{ESMDl.config.username}&"
      url << "productid=#{@release['productId']}&"
      url << "rlsversion=#{@release['version']}&"
      url << "esmversion=#{ESMDl.config.esmversion}&"
      url << "filepath=#{URI.encode(filepath)}&"
      url << "filename=#{filename}&"
    end

    def fetch(url, filename)
      uri = URI(url)
      full_path = "#{ESMDl.config.stage_dir}#{filename}"
      print "Starting download of #{full_path}..."
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        request = Net::HTTP::Get.new uri.request_uri
        request.basic_auth ESMDl.config.username, ESMDl.config.password
        http.request request do |response|
          open full_path, 'w' do |io|
            response.read_body do |chunk|
              io.write chunk
            end
          end
        end
      end
      filesize = File::size(full_path)
      puts "done! (#{ Filesize.from("#{filesize} B").pretty})"
    end
  end
end
