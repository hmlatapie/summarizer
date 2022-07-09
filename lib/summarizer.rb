# frozen_string_literal: true

require "net/http"
require "json"
require "down"
require "pdf-reader"
require_relative "summarizer/version"
require_relative "summarizer/client"
require_relative "summarizer/open_ai"
require_relative "summarizer/document"
require_relative "summarizer/summary"

# Summarizer main module
module Summarizer
  class Error < StandardError; end

  def self.summarize(url)
    puts "Loading document..."
    doc = Document.new(url)
    puts "Document has #{doc.words_count} words."
    Summary.new(doc).summarize
  end
end
