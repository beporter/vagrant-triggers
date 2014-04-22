module VagrantPlugins
  module HaltOthers
    module Action
      def self.action_trigger(condition)
        Vagrant::Action::Builder.new.tap do |b|
          b.use Trigger, condition
        end
      end

      # Autoload farm
      action_root = Pathname.new(File.expand_path("../action", __FILE__))
      autoload :Trigger, action_root.join("trigger")
    end
  end
end