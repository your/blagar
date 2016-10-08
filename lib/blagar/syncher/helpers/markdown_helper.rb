module Blagar
  module Syncher
    module MarkdownHelper
      require 'redcarpet'

      def self.markdown_to_html(markdown_file)
        options = {
          filter_html: true,
          hard_wrap: true,
          link_attributes: { rel: 'nofollow', target: "_blank" },
          space_after_headers: true,
          fenced_code_blocks: true
        }

        extensions = {
          autolink: true,
          superscript: true,
          disable_indented_code_blocks: true
        }

        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)

        markdown.render(markdown_file)
      end
    end
  end
end
