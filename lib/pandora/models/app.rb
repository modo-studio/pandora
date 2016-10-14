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

      # Initializes the app with a dictionary that represents the app.
      # @param [Hash] hash representing the app.
      # @return [App] app initialized from the dictionary
      def initialize(name, yml)
        @name = name
        @project_path = yml[:project_path]
        raise "The app #{@name} doesn't include project_path attribute" unless @project_path
        @workspace_path = yml[:workspace_path]
        raise "The app #{@name} doesn't include workspace_path attribute" unless @workspace_path
        @target_name = yml[:target_name]
        raise "The app #{@name} doesn't include target_name attribute" unless @target_name
        @test_target_name = yml[:test_target_name]
        @dependencies = yml[:dependencies]
        @dependencies ||= []
      end

    end
  end
end