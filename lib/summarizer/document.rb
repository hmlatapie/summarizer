# frozen_string_literal: true

module Summarizer
  # Remote document reader
  class Document
    attr_reader :url

    def initialize(url, tempfile: nil)
      @url = url
      @tempfile = tempfile
    end

    def pages
      @pages ||= download_content.map { |page| page.gsub(/\n+/, "\n").gsub(/\s+/, " ") }
    end

    def words_count
      @words_count ||= pages.join(" ").split(/\s+/).count
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
