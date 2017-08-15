require 'json'
require 'net/http'
require 'esmdl/version'
require 'esmdl/configuration'
require 'esmdl/download'

module ESMDl
  class << self
    attr_accessor :config
    attr_accessor :products
    attr_accessor :releases
    attr_accessor :prodmap
    attr_accessor :esmversion
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield(config)
  end

  def self.fetch_metadata
    r = nil
    uri = URI(config.base_url + "/releaseservices/AvailableReleases?esmversion=#{config.esmversion}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.ciphers = ['AES128-SHA']
    request = Net::HTTP::Get.new uri.request_uri
    request.basic_auth config.username, config.password
    response = http.request request
    if response.code != '200'
      raise "Problem fetching ESM metadata: #{response.body}"
    end
    r = JSON.parse(response.body)

    @products = {}
    @codemap = {}
    r['prodCodeMap'].split("\n").each do |line|
      a = line.split(',')
      @codemap[a[1]] = a[2]
    end

    r['clientLicensedProducts'].sort.each do |p|
      @products[p] = @codemap[p]
    end

    @releases = r['available']
  end
end
