# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.2.0"
  raise "The Vagrant Triggers plugin is only compatible with Vagrant 1.1+"
end

module VagrantPlugins
  module Triggers
    class Plugin < Vagrant.plugin("2")
      name "Triggers"
      description <<-DESC
      This plugin allow the definition of arbitrary scripts that
      will run on the host before and/or after Vagrant commands.
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
        I18n.load_path << File.expand_path("locales/en.yml", Triggers.source_root)
        I18n.reload!
      end
    end
  end
end
