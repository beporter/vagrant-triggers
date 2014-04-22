module VagrantPlugins
  module HaltOthers
    module Errors
      class VagrantTriggerError < Vagrant::Errors::VagrantError
        error_namespace("vagrant_triggers.errors")
      end

      class CommandFailed < VagrantTriggerError
        error_key(:command_failed)
      end

      class CommandUnavailable < VagrantTriggerError
        error_key(:command_unavailable)
      end
    end
  end
end