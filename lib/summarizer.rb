# frozen_string_literal: true

require "ruby/openai"
require "down"
require "pdf-reader"
require_relative "summarizer/version"

module Summarizer
  class Error < StandardError; end

  def self.summarize(url)
    summarize_pages(pdf_text(url))
  end

  def self.pdf_text(url)
    tempfile = Down.download(url)
    PDF::Reader.new(tempfile.path).pages.map(&:text)
  end

  def self.summarize_pages(pages)
    client = OpenAI::Client.new
    pages.map do |page|
      text = "#{page.gsub(/\n+/, "\n").gsub(/\s+/, " ")}\n tl;dr:"
      response = client.completions(
        engine: "text-babbage-001",
        parameters: {
          prompt: text,
          temperature: 0.3
        }
      )
      response.parsed_response["choices"]&.first&.fetch("text")
    end.compact.join("\n")
  end
end
