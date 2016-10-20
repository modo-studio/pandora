require 'xcodeproj'
require 'rest-client'
require 'zip'
require 'fileutils'

module Pandora
  module Commands
    class Create

      # Initializes the command
      # @param [String] directory where the framework will be created.
      # @param [String] framework name.
      # @return [Create] initialized command.
      def initialize(path, name)
        @path = path
        @name = name
        @url = "https://github.com/frameworkoriented/template/archive/master.zip"
      end

      # Executes the command
      def execute
        self.download_template
        self.unzip_template
        self.rename_folders(self.framework_path)
        self.rename_files
      end

      protected

      def download_template
        puts "=> Downloading framework template"
        response = RestClient.get(@url)
        File.delete(self.zip_path) if File.exist?(self.zip_path)
        zip_file = File.new(self.zip_path, "wb")
        zip_file << response.body
        zip_file.close
        puts "=> Framework template downloaded"
      end

      def unzip_template
        puts "=> Uncompressing template"
        Zip::File.open(self.zip_path) do |zip_file|
          zip_file.each do |f|
            fpath = File.join(@path, f.name)
            zip_file.extract(f, fpath) unless File.exist?(fpath)
          end
        end
        FileUtils.remove(self.zip_path) if File.exist?(self.zip_path)
        FileUtils.remove_dir self.framework_path if File.exist?(self.framework_path)
        FileUtils.mv File.join(@path, "template-master"), self.framework_path
        puts '=> Template uncompressed'
      end

      def rename_folders(path)
        Dir[File.join(path, "*")].each do |file_path|
          file_new_path = file_path.gsub("Cuca", @name)
          FileUtils.mv file_path, file_new_path if file_path != file_new_path
          if File.directory?(file_new_path)
            self.rename_folders(file_new_path)
          end
        end
      end

      def rename_files
        Dir[File.join(@path, "**/*")]
        .select { |fn| !File.directory?(fn) }
        .each do |file_path|
          text = File.read(file_path)
          new_contents = text.gsub("Cuca", @name)
          File.open(file_path, "w") {|file| file.puts new_contents }
        end
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
