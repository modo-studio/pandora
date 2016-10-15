require 'thor'
require_relative "../commands/create"
require_relative "../models/framework"

module Pandora
  module Client
    class Main < Thor

      desc "create CORE", "create a CORE framework"
      option :path, :type => :string, :required => false
      def create(name)
        framework = Models::Framework.new(name, self.project_path(name, options[:path]), [])
        Pandora::Commands::Create.new(framework).execute
      end

      private

      def project_path(name, path)
        raise "Project should be the folder, not the .xcodeproj file" if path.include? ".xcodeproj"
        path ||= Dir.expand_path("./#{name}")
        Dir.join(path, "#{name}.xcodeproj")
      end

    end
  end
end


# :desc: A description for the option. When printing out full usage for a command using cli help hello, this description will appear next to the option.
# :banner: The short description of the option, printed out in the usage description. By default, this is the upcase version of the flag (from=FROM).
# :required: Indicates that an option is required
# :default: The default value of this option if it is not provided. An option cannot be both :required and have a :default.
# :type: :string, :hash, :array, :numeric, or :boolean
# :aliases: A list of aliases for this option. Typically, you would use aliases to provide short versions of the option.