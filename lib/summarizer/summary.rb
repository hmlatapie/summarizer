# frozen_string_literal: true

module Summarizer
  class Summary
    attr_reader :content_pages
  
    def initialize(document)
      @content_pages = document.pages
    end

    def redact
      pages.filter_map do |page|
        text = "#{page}\n tl;dr:"
        response = openai.completions_text(prompt: text, temperature: 0.3).first
        response if !response.nil? && !response.empty?
      end.join("\n")
    end

    private

    def openai
      @openai ||= OpenAI.new
    end
  end
end