require "komainu/search_result"

module Komainu
  class SearchResults
    attr_accessor :items, :suggestion

    def initialize
      @items = []
    end
  end
end
