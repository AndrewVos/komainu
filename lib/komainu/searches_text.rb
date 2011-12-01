require "komainu/calculates_levenshtein_distance"
require "komainu/search_results"
require "komainu/match"

module Komainu
  class SearchResult
    attr_reader :object, :matches
    def initialize object, matches
      @object = object
      @matches = matches
    end
  end

  class SearchesText
    def initialize data_to_search
      @data_to_search = data_to_search
    end

    def search query
      results = SearchResults.new
      @data_to_search.each do |searchable|
        matches = find_matches(searchable.text, query)
        if matches.any?
          results.items << SearchResult.new(searchable, matches)
        end
      end

      results.suggestion = calculate_suggestion(query)
      results
    end

    private

    def calculate_suggestion(query)
      words = split_into_words(@data_to_search.map { |searchable| searchable.text }.join(" "))
      levenshtein = CalculatesLevenshteinDistance.new(words)

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

    def find_matches text, string
      text = text.downcase
      matches = []
      offset = 0
      string.split(" ").each { |word|
        word = word.downcase
        while matched_index = text.index(word, offset)
          matches << Match.new(matched_index, word)
          offset = matched_index + 1
        end
      }
      matches
    end
  end
end
