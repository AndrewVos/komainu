require "komainu/levenshtein"
require "komainu/search_results"

module Komainu
  class SearchesText
    def initialize data_to_search
      @data_to_search = data_to_search
    end

    def search query
      results = SearchResults.new
      @data_to_search.each do |name, text|
        if text_includes_string(text, query)
          results.items << SearchResult.new(name, text)
        elsif text_includes_words_from_string(text, query)
          results.items << SearchResult.new(name, text)
        end
      end

      results.suggestion = calculate_suggestion(query)
      results
    end

    private

    def calculate_suggestion(query)
      words = split_into_words(@data_to_search.values.join(" "))
      levenshtein = Levenshtein.new(words)
      suggestion = split_into_words(query).map do |word|
        matches = levenshtein.search(word, 2)
        matches.keys.first || word
      end
      suggestion.join(" ")
    end

    def split_into_words(string)
      string.scan(/\b\w+\b/)
    end

    def text_includes_string text, string
      text.downcase.include? string.downcase
    end

    def text_includes_words_from_string text, string
      string.split(" ").any? do |word|
        text_includes_string(text, word)
      end
    end
  end
end
