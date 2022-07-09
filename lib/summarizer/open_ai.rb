# frozen_string_literal: true

module Summarizer
  # OpenAI adapter
  class OpenAI
    attr_reader :engine

    def initialize(engine: "text-babbage-001", access_token: nil)
      @engine = engine
      @access_token = access_token || ENV.fetch("OPENAI_ACCESS_TOKEN")
      @client = Client.new("https://api.openai.com/", access_token: @access_token)
    end

    def completions(**args)
      client.post("v1/engines/#{engine}/completions", args)
    end

    def completions_text(**args)
      completions(**args).fetch("choices")&.map { |c| c["text"] } || {}
    end

    private

    attr_reader :access_token, :client
  end
end
