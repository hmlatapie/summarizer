# frozen_string_literal: true

module Summarizer
  # Basic json ruby client
  class Client
    attr_reader :base_url
    
    def initialize(base_url, access_token: nil) 
      @base_url = base_url
      @access_token = access_token 
    end

    def post(path, body)
      uri = URI.join(base_url, path)
      res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        req = Net::HTTP::Post.new(uri)
        req.body = body.to_json
        req["Content-Type"] = "application/json"
        req["Authorization"] = "Bearer #{access_token}" if access_token
        http.request(req)
      end
      safe_parse(res.body)
    end

    private

    attr_reader :access_token

    def safe_parse(str)
      JSON.parse(str)
    rescue JSON::ParserError
      {}
    end
  end
end