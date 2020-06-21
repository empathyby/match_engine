# frozen_string_literal: true

require 'mimemagic'

require 'match_engine/entities/base'

module MatchEngine
  module Entities
    module Search
      include Base

      def search(file, min_score: 30, check_horizontal_flip: true, limit: 10, offset: 0)
        post_file(
          'search',
          body: file,
          type: MimeMagic.by_magic(file).type,
          filename: File.basename(file.path),
          min_score: min_score,
          check_horizontal_flip: check_horizontal_flip,
          limit: limit,
          offset: offset
        ) do |response_object|
          return [] unless response_object.success?

          response_object.body['result']
        end
      end
    end
  end
end
