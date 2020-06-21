# frozen_string_literal: true

require 'match_engine/entities/add'
require 'match_engine/entities/count'
require 'match_engine/entities/delete'
require 'match_engine/entities/list'
require 'match_engine/entities/search'

module MatchEngine
  class Client
    include MatchEngine::Entities::Add
    include MatchEngine::Entities::Count
    include MatchEngine::Entities::Delete
    include MatchEngine::Entities::List
    include MatchEngine::Entities::Search

    def initialize(company:, user:, pass:)
      @company = company
      @user = user
      @pass = pass
      @base_uri = "https://matchengine.tineye.com/#{company}/rest"
    end
  end
end
