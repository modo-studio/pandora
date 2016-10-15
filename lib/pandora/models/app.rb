module Pandora
  module Models
    class App

      # Application name
      attr_reader :name

      # Project directory (.xcodeproj)
      attr_reader :project_path

      # Workspace directory (.xcworkspace)
      attr_reader :workspace_path

      # Application target name
      attr_reader :target_name

      # Application test target name
      attr_reader :test_target_name

      # Application dependencies
      attr_reader :dependencies

      # Initializes an App.
      # @param [String] application name.
      # @param [String] project path.
      # @param [String] workspace path.
      # @param [String] application main target name.
      # @param [String] application main tests target name.
      # @param [String] dependencies.
      # @return [App] initialized App.
      def initialize(name, project_path, workspace_path, target_name, test_target_name, dependencies)
        @name = name
        @project_path = project_path
        @workspace_path = workspace_path
        @target_name = target_name
        @test_target_name = test_target_name
        @dependencies = dependencies
      end

      # Initializes an App from a YAML hash.
      # @param [String] application name.
      # @param [Hash] hash that represents the app.
      # @raise [StandardError] if any of the required attributes are missing (project_path, workspace_path, target_name)
      # @return [App] initialized App.
      def self.from_yml(name, yml)
        project_path = yml["project_path"]
        raise "The app #{name} doesn't include project_path attribute" unless project_path
        workspace_path = yml["workspace_path"]
        raise "The app #{name} doesn't include workspace_path attribute" unless workspace_path
        target_name = yml["target_name"]
        raise "The app #{name} doesn't include target_name attribute" unless target_name
        test_target_name = yml["test_target_name"]
        dependencies = yml["dependencies"]
        dependencies ||= []
        App.new(name, project_path, workspace_path, target_name, test_target_name, dependencies)
      end

    end
  end
end