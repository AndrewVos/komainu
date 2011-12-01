require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))
require "komainu/searches_text"

module Komainu
  describe SearchesText do
    subject { SearchesText.new(data_to_search) }

    let :data_to_search do
      @item1 = OpenStruct.new({:text => "This is some text."})
      @item2 = OpenStruct.new({:text => "Batman has no parents"})
      [@item1, @item2]
    end

    it "finds exact matches" do
      result = subject.search("Batman has")
      result.items.size.must_equal 1
      result.items.first.object.must_equal @item2
    end

    it "finds matches in any case" do
      result = subject.search("BATMAN has")
      result.items.size.must_equal 1
      result.items.first.object.must_equal @item2
    end

    it "finds matches if the text is not in order" do
      result = subject.search("has batman")
      result.items.size.must_equal 1
      result.items.first.object.must_equal @item2
    end

    it "suggests an alternate query" do
      result = subject.search("btman")
      result.suggestion.must_equal "Batman"
    end

    it "only suggests an alternate query if the alternate query is different" do
      result = subject.search("Batman")
      result.suggestion.must_be_nil
    end

    it "finds the best suggestion" do
      item = OpenStruct.new
      item.text = "helloo hellp"
      result = SearchesText.new([item]).search("hell")
      result.suggestion.must_equal "hellp"
    end

    it "knows where the matches were" do
      item = OpenStruct.new
      item.text = "Derp herp"

      result = SearchesText.new([item]).search("derp herp")

      result.items.first.matches.size.must_equal 2

      result.items.first.matches[0].text.must_equal "derp"
      result.items.first.matches[0].index.must_equal 0

      result.items.first.matches[1].text.must_equal "herp"
      result.items.first.matches[1].index.must_equal 5
    end
  end
end
