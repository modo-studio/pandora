require 'xcodeproj'

module Pandora
  module Commands
    class Create

      # Framework to be created
      attr_reader :framework

      # Initializes the command with the framework that has to be created
      # @param [Framework] framework that the command should create.
      # @return [Create] initialized command.
      def initialize(framework)
        @framework = framework
      end

      # Executes the command
      def execute
        self.create_folder
        self.create_project
        self.create_targets
        self.setup_configuration
        self.link_dependencies
      end

      private

      def create_folder
        #TODO
      end

      def create_project
        # TODO
      end

      def create_targets
        # TODO
      end

      def setup_configuration
        # TODO
      end

      def link_dependencies
        # TODO
      end

    end
  end
end