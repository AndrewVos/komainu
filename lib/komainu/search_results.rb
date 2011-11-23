module Komainu
  class SearchResults
    attr_accessor :items, :suggestion

    def initialize
      @items = []
    end

    def to_s
      {
        :suggestion => suggestion,
        :items => items.map { |item| item.text }
      }.to_s
    end
  end
end
