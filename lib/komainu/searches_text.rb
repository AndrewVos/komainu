module Komainu
  class SearchesText
    def initialize data_to_search
      @data_to_search = data_to_search
    end

    def search query
      results = []
      @data_to_search.each do |name, text|
        if text_includes_string(text, query)
          results << SearchResult.new(name, text)
        elsif text_includes_words_from_string(text, query)
          results << SearchResult.new(name, text)
        end
      end
      results
    end

    private

    def text_includes_string text, string
      text.downcase.include? string.downcase
    end

    def text_includes_words_from_string text, string
      string.split(" ").any? do |word|
        text_includes_string(text, word)
      end
    end
  end

  class SearchResult
    attr_accessor :name, :text

    def initialize name, text
      @name = name
      @text = text
    end
  end
end
