module ESMDl
  class Configuration
    attr_accessor :username
    attr_accessor :password
    attr_accessor :stage_dir
    attr_accessor :base_url
    attr_accessor :verbosity
    attr_accessor :esmversion

    def initialize
      @verbosity = :normal
    end

    def stage_dir=(dir)
      @stage_dir = "#{dir}/" unless dir.end_with? '/'
    end
  end
end
