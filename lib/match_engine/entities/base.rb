# frozen_string_literal: true

require 'faraday'

require 'match_engine/response'

module MatchEngine
  module Entities
    module Base
      protected

      def get(path, params = {})
        result = conn.get(path, params)
        response = parse_response(result)

        yield response
      end

      def post_file(path, options)
        payload = {
          image: image_object(options),
          filepath: options[:filepath]
        }

        parse_response(conn.post(path, payload))
      end

      def search_file(path, options)
        payload = {
          image: image_object(options),
          min_score: options[:min_score],
          check_horizontal_flip: options[:check_horizontal_flip],
          limit: options[:limit],
          offset: options[:offset]
        }

        parse_response(conn.post(path, payload))
      end

      def parse_response(raw_response)
        Response.new(raw_response)
      end

      def image_object(options)
        Faraday::UploadIO.new(
          options[:body],
          options[:type],
          options[:filename]
        )
      end

      def conn
        @conn ||= Faraday.new(url: @base_uri) do |f|
          f.adapter :net_http
          f.basic_auth(@user, @pass)
          f.request :multipart
          f.request :url_encoded
        end
      end
    end
  end
end
