# frozen_string_literal: true

require 'json'

module MatchEngine
  class Response
    def initialize(response)
      @response = response
    end

    def success?
      @response.status == 200 && status == 'ok'
    end

    def status
      body&.dig('status')
    end

    def error
      body&.dig('error')
    end

    def body
      @body ||= JSON.parse(@response.body)
    end
  end
end
