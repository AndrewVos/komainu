require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))
require "komainu/levenshtein"

module Komainu
  describe Levenshtein do
    it "finds words with a distance less the maximum distance" do
      levenshtein = Levenshtein.new(["hello", "there", "good", "sirs"])
      levenshtein.search("hell", 14).must_equal({
        "hello" => 1,
        "there" => 3,
        "good"  => 4,
        "sirs"  => 4
      })
    end
  end
end
