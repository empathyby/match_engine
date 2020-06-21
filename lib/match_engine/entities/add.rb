# frozen_string_literal: true

require 'mimemagic'

require 'match_engine/entities/base'

module MatchEngine
  module Entities
    module Add
      include Base

      def add_file(file, path: nil)
        post_file(
          'add',
          body: file,
          type: MimeMagic.by_magic(file).type,
          filename: File.basename(file.path),
          filepath: path
        )
      end
    end
  end
end
