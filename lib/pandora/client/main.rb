require 'thor'
require_relative "../commands/create"

module Pandora
  module Client
    class Main < Thor

      desc "create CORE", "create a CORE framework"
      def create(name)
        Pandora::Commands::Create.new(Dir.pwd, name).execute
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
