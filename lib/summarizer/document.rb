# frozen_string_literal: true

module Summarizer
  # Remote document reader
  class Document
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def pages
      @pages ||= download_content.gsub(/\n+/, "\n").gsub(/\s+/, " ")
    end

    def words_count
      @words_count ||= pages.split(/\s+/).count
    end

    private

    def download_content
      PDF::Reader.new(tempfile.path).pages.map(&:text)
    end

    def tempfile
      @tempfile ||= Down.download(url)
    end
  end
end
