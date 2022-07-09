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
    doc = Document.new(url)
    Summary.new(doc).redact
  end
end
