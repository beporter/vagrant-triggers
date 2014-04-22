require "pathname"
require "vagrant-halt-others/plugin"

module VagrantPlugins
  module HaltOthers
    lib_path = Pathname.new(File.expand_path("../vagrant-halt-others", __FILE__))
    autoload :Action,   lib_path.join("action")
    autoload :Config,   lib_path.join("config")
    autoload :Errors,   lib_path.join("errors")
    
    # This returns the path to the source of this plugin.
    #
    # @return [Pathname]
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path("../../", __FILE__))
    end
  end
end
