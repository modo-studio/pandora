module Pandora
  module Models
    class PandoraProject

      attr_reader :project_path,
                  :workspace_path,
                  :name,
                  :build_target,
                  :test_targets,
                  :dependencies

      # Initializes the project from a YAML dictionary.
      # @param [Hash] dictionary that represents the object.
      # @return [PandoraProject] initialized project with all the properties. If the validation fails during the instantiation, an error will be thrown.
      def initialize(yml)
        @project_path = yml[:project_path]
        @workspace_path = yml[:workspace_path]
        @name = yml[:name]
        @build_target = yml[:build_target]
        @tests_targets = yml[:test_targets]
        @tests_targets ||= []
        @dependencies = yml[:dependencies]
        @dependencies ||= []
        self.validate
      end

      # Private

      private

      # Validates if the model includes all the required properties. Name, path and build_target are required
      # If the validation fails it'll raise an error.
      def validate
        raise "Project #{@name} doesn't include a valid workspace/project" unless @project_path || @workspace_path
        raise "Project at #{self.project_or_workspace_path} doesn't include name" unless @name
        raise "Project at #{@name} doesn't include a build target" unless @build_target
      end

      # Returns the project path if it's been specified, otherwise it returns the workspace path.
      # @return [String] project/workspace path. Whichever has value.
      def project_or_workspace_path
        if @project_path
          @project_path
        else
          @workspace_path
        end
      end

    end
  end
end

