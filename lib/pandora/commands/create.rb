require 'xcodeproj'
require 'rest-client'
require 'zip'
require 'fileutils'
require 'colorize'

module Pandora
  module Commands
    class Create

      # Initializes the command
      # @param [String] directory where the framework will be created.
      # @param [String] framework name.
      # @param [String] framework organization.
      # @return [Create] initialized command.
      def initialize(path, name, organization)
        @path = path
        @name = name
        @organization = organization
        @url = "https://github.com/frameworkoriented/template/archive/master.zip"
      end

      # Executes the command
      def execute
        self.download_template
        self.unzip_template
        self.rename_files(self.framework_path)
        self.rename_files_content
        puts "Enjoy #{@name} FRAMEWORK! #yatusabes".colorize(:light_yellow)
        system "pedropinerabuendia.xcuserdatad"
        system "open #{project_path}"
      end

      protected

      def download_template
        puts "=> Downloading framework template".colorize(:green)
        response = RestClient.get(@url)
        File.delete(self.zip_path) if File.exist?(self.zip_path)
        zip_file = File.new(self.zip_path, "wb")
        zip_file << response.body
        zip_file.close
        puts "=> Framework template downloaded".colorize(:green)
      end

      def unzip_template
        puts "=> Uncompressing template".colorize(:green)
        Zip::File.open(self.zip_path) do |zip_file|
          zip_file.each do |f|
            fpath = File.join(@path, f.name)
            zip_file.extract(f, fpath) unless File.exist?(fpath)
          end
        end
        FileUtils.remove(self.zip_path) if File.exist?(self.zip_path)
        FileUtils.remove_dir self.framework_path if File.exist?(self.framework_path)
        FileUtils.mv File.join(@path, "template-master"), self.framework_path
        puts '=> Template uncompressed'.colorize(:green)
      end

      def rename_files(path)
        Dir[File.join(path, "*")].each do |file_path|
          file_new_path = file_path.gsub("XXXXX", @name)
          FileUtils.mv file_path, file_new_path if file_path != file_new_path
          if File.directory?(file_new_path)
            self.rename_files(file_new_path)
          end
        end
      end

      def rename_files_content
        puts "=> Renaming files content".colorize(:green)
        Dir[File.join(self.framework_path, "**/*")]
            .select { |fn| !File.directory?(fn) }
            .each do |file_path|
          text = File.read(file_path)
          new_contents = text.gsub("XXXXX", @name)
          new_contents = new_contents.gsub("YYYYY", @organization)
          File.open(file_path, "w") {|file| file.puts new_contents }
        end
        puts "=> Contents renamed".colorize(:green)
      end

      def project_path
        File.join(self.framework_path, "#{@name}.xcworkspace")
      end

      def framework_path
        File.join(@path, "#{@name}")
      end

      def zip_path
        File.join(@path, "#{@name}.zip")
      end

    end
  end
end
