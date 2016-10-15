module Pandora
  module Models
    class Framework

      # Framework name
      attr_reader :name

      # Project path (.xcodeproj)
      attr_reader :project_path

      # Array of dependencies (names)
      attr_reader :dependencies

      # Initializes the framework from a YML hash.
      # @param [String] framework name.
      # @param [String] project path.
      # @param [[String]] framework dependencies list.
      # @return [Framework] initialized Framework.
      def initialize(name, project_path, dependencies)
        @name = name
        @project_path = project_path
        raise "Wrong project path. It should be a .xcodeproj" unless @project_path.include?(".xcodeproj")
        @dependencies = dependencies
      end

      # Initializes a Framework from a YAML dictionary.
      # @param [String] framework name.
      # @param [Hash] dictionary that represents the framework
      # @raise [StandardError] if the dictionary doesn't include a project_path
      # @return [Framework] initialized Framework.
      def self.from_yml(name, yml)
        project_path = yml["project_path"]
        raise "Project not specified for framework #{name}" unless project_path
        dependencies = yml["dependencies"]
        dependencies ||= []
        Framework.new(name, project_path, dependencies)
      end

    end
  end
end