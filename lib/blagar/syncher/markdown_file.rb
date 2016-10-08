module Blagar
  module Syncher
    class MarkdownFile
      require 'blagar/syncher/helpers/markdown_helper'

      def initialize(source = nil)
        @content = File.read(source)
      end

      def to_html
        MarkdownHelper.markdown_to_html(@content)
      end
    end
  end
end
