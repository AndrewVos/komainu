module Komainu
  class SearchResult
    attr_accessor :name, :text

    def initialize name, text
      @name = name
      @text = text
    end
  end
end
