require 'fileutils'
require 'blagar/syncher/markdown_file'

module Blagar
  module Syncher
    SOURCE_BASE_DIR = './source'.freeze
    SYNCH_BASE_DIR = './compiled/raw'.freeze
    SYNCH_SUB_DIRS = %w(css js).freeze
    TEMPLATE_FILE = 'shared.html'.freeze

    def self.run
      # Compile HTML files by injecting Mardown files in a shared.html template
      partial_html_contents.each do |filename, partial_html_content|
        compile_final_html_file(filename, partial_html_content)
        puts "Compiled #{SYNCH_BASE_DIR}/#{filename}"
      end

      # Copy raw assets
      SYNCH_SUB_DIRS.each do |synch_sub_dir|
        Dir.glob("#{SOURCE_BASE_DIR}/#{synch_sub_dir}/*.#{synch_sub_dir}").map do |filename|
          FileUtils.cp(filename, "#{SYNCH_BASE_DIR}/#{filename.split('/').last}")
          puts "Copied #{SYNCH_BASE_DIR}/#{filename}"
        end
      end
    end

    private

    def self.partial_html_contents
      Dir.glob("#{SOURCE_BASE_DIR}/md/*.md").map do |filename|
        markdown_file = MarkdownFile.new(filename)
        [filename.split('/').last.gsub('.md','.html'), markdown_file.to_html]
      end
    end

    def self.compile_final_html_file(filename, partial_html_content)
      File.write("#{SYNCH_BASE_DIR}/#{filename}", load_template.gsub('<% PARTIAL_CONTENT %>', partial_html_content))
    end

    def self.load_template
      File.read("#{SOURCE_BASE_DIR}/#{TEMPLATE_FILE}")
    end
  end
end
