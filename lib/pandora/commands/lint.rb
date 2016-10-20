module Pandora
  module Commands
    class Lint

      # File that has to be validated.
      attr_reader :file

      # Initializes the command with the file that has to be validated.
      # @param [File] file that has to be validated
      # @return [Lint] initialized command.
      def initialize(file)
        @file = file
      end

      # Executes the command
      def execute
        # TODO
      end

    end
  end
end
