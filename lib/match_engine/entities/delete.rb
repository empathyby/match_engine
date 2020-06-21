# frozen_string_literal: true

require 'mimemagic'

require 'match_engine/entities/base'

module MatchEngine
  module Entities
    module Delete
      include Base

      def delete(filepath)
        get('delete', { filepath: filepath }) do |response_object|
          response_object.success?
        end
      end
    end
  end
end
