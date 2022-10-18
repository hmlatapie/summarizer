# frozen_string_literal: true

module Summarizer
  # Interface for summarization with OpenAI
  class Summary
    attr_reader :content_pages

    def initialize(document)
      @content_pages = document.pages
    end

    def summarize
      content_pages.filter_map do |page|
        text = "#{page}\n tl;dr:"
        response = openai.completions_text(prompt: text, temperature: 0.3, max_tokens:200).first
        response if !response.nil? && !response.empty?
      end.join("\n")
    end

    private

    def openai
      @openai ||= OpenAI.new
    end
  end
end
