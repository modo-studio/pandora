require_relative 'app'
require_relative 'framework'

module Pandora
  module Models
    class File

      attr_reader :apps, :frameworks

      # Initializes the pandora file from a YAML file.
      # @param [Hash/Arry] YAML file that represents the file.
      # @raise [StandardError] if there's an error in the file definition.
      # @return [PandoraFile] initialized pandora file.
      def initialize(yml)
        yml_apps = yml["apps"]
        yml_apps ||= []
        @apps = yml_apps.map { |app_name, app|
          App.from_yml(app_name.to_s, app)
        }
        yml_frameworks = yml["frameworks"]
        yml_frameworks ||= []
        @frameworks = yml_frameworks.map { |framework_name, framework|
          Framework.from_yml(framework_name.to_s, framework)
        }
      end

    end
  end
end