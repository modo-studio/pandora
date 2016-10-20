require 'thor'
require_relative "../commands/create"

module Pandora
  module Client
    class Main < Thor

      desc "create CORE ORGANIZATION", "create a CORE framework"
      def create(name, organization)
        Pandora::Commands::Create.new(Dir.pwd, name, organization).execute
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
