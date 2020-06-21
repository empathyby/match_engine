# frozen_string_literal: true

require 'match_engine/entities/base'

module MatchEngine
  module Entities
    module Count
      include Base

      def count
        get('count') do |response_object|
          return 0 unless response_object.success?

          response_object.body['result'].first.to_i
        end
      end
    end
  end
end
