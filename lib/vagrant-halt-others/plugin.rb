# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.2.0"
  raise "The Vagrant Halt Others plugin is only compatible with Vagrant 1.1+"
end

module VagrantPlugins
  module HaltOthers
    class Plugin < Vagrant.plugin("2")
      name "HaltOthers"
      description <<-DESC
      This plugin traps the `vagrant up` command, checks for
      other boxes running via vagrant and issues a `halt`
      command to each before proceeding with the current request.
      DESC

      action_hook(:init_i18n, :environment_load) { init_i18n }

      action_hook(:trigger, Plugin::ALL_ACTIONS) do |hook|
        require_relative "action"
        unless ENV["VAGRANT_NO_TRIGGERS"]
          hook.prepend(Action.action_trigger(:before))
          hook.append(Action.action_trigger(:after))
        end
      end

      config(:trigger) do
        require_relative "config"
        Config
      end

      # This initializes the I18n load path so that the plugin specific
      # transations work.
      def self.init_i18n
        I18n.load_path << File.expand_path("locales/en.yml", HaltOthers.source_root)
        I18n.reload!
      end
    end
  end
end
