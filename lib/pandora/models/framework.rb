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
      # @param [Hash] hash that represents the framework.
      def initialize(name, yml)
        @name = name
        @project = yml[:project]
        @dependencies = yml[:dependencies]
        @dependencies ||= []
        raise "Project not specified for framework #{@name}"
      end

    end
  end
end