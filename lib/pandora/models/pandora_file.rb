require_relative 'pandora_project'

module Pandora
  module Models
    class PandoraFile

      attr_reader :projects

      # Initializes the pandora file from a YAML file.

      # @param [Hash/Arry] YAML file that represents the project/projects.
      # @return [PandoraFile] initialized pandora file.
      def initialize(yml)
        if yml.kind_of? Hash
          @projects = [PandoraProject.new(yml)]
        elsif yml.kind_of? Array
          @projects = yml.map { |p| PandoraProject.new(p) }
        end
      end

    end
  end
end