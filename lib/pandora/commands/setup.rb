module Pandora
  module Commands
    class Setup

      # File that specifies the setup to be created
      attr_reader :file

      # Initializes the command with the file whose setup must be created.
      # @param [File] file that specifies the setup to be created.
      # @return [Setup] initialized command.
      def initialize(file)
        @file = file
      end

      # Executes the command
      def execute
        self.create_projects
        self.setup_workspace
        self.link_dependencies
        self.embed_frameworks
      end

      private

      def create_projects
        # TODO
      end

      def setup_workspace
        # TODO
      end

      def link_dependencies
        # TODO
      end

      def embed_frameworks
        # TODO
      end

    end
  end
end