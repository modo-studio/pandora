module Pandora
  module Validators
    class PandoraFileValidator

      # Validates a pandora file ensuring the existence of the project/workspaces and targets specified.
      # If the validation fails it raises an error.
      # @param [PandoraFile] file that represents project/projects
      def validate(pandora_file)
        pandora_file.projects.each { |p| self.validate_project(p) }
      end

      private

      # Validates a project. It ensures the project/workspace and targets specified exist.
      # If the validation fails it raises an error.
      # @param [PandoraProject] file that represents a project.
      def validate_project(project)

      end

    end
  end
end