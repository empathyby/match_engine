# frozen_string_literal: true

require 'match_engine/entities/base'

module MatchEngine
  module Entities
    module List
      include Base

      def list(limit: 20, offset: 0)
        get(
          'list',
          {
            limit: limit,
            offset: offset
          }
        ) do |response_object|
          return [] unless response_object.success?

          response_object.body['result']
        end
      end
    end
  end
end
