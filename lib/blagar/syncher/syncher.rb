module Blagar
  module Syncher
    TEMPLATE_FILE = 'shared.tpl'.freeze
    MARKDOWN_DIR = './source/md'.freeze
    SYNCH_DIR = './compiled/raw/html'.freeze

    def self.run
      partial_html_contents.each do |filename, partial_html_content|
        compile_final_html_file(filename, partial_html_content)
        puts "Compiled #{SYNCH_DIR}/#{filename}"
      end
    end

    private

    def self.partial_html_contents
      require 'blagar/syncher/markdown_file'

      Dir.glob("#{MARKDOWN_DIR}/*.md").map do |filename|
        markdown_file = MarkdownFile.new(filename)
        [filename.split('/').last.gsub('.md','.html'), markdown_file.to_html]
      end
    end

    def self.compile_final_html_file(filename, partial_html_content)
      File.write("#{SYNCH_DIR}/#{filename}", load_template.gsub('<% PARTIAL_CONTENT %>', partial_html_content))
    end

    def self.load_template
      File.read(TEMPLATE_FILE)
    end
  end
end
