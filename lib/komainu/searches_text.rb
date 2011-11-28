require "komainu/levenshtein"
require "komainu/search_results"

module Komainu
  class SearchesText
    def initialize data_to_search
      @data_to_search = data_to_search
    end

    def search query
      results = SearchResults.new
      @data_to_search.each do |searchable|
        if text_includes_words_from_string(searchable.text, query)
          results.items << searchable
        end
      end

      results.suggestion = calculate_suggestion(query)
      results
    end

    private

    def calculate_suggestion(query)
      words = split_into_words(@data_to_search.map { |searchable| searchable.text }.join(" "))
      levenshtein = Levenshtein.new(words)

      suggestion = split_into_words(query).map do |word|
        matches = levenshtein.search(word, 2)

        if matches.empty? != true && matches.keys.first != word
          matches.sort {|a,b| a[1] <=> b[1]}.first.first
        else
          word
        end
      end

      suggestion = suggestion.join(" ")
      if suggestion != query
        suggestion
      else
        nil
      end
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
