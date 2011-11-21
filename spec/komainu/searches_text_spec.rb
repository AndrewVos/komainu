require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))
require "komainu/searches_text"

module Komainu
  describe SearchesText do
    subject { SearchesText.new(data_to_search) }

    let :data_to_search do
      {
        :item1 => "This is some text",
        :item2 => "Batman has no parents"
      }
    end

    it "finds exact matches" do
      result = subject.search("Batman has")
      result.size.should == 1
      result.first.name.should == :item2
    end

    it "finds matches in any case" do
      result = subject.search("BATMAN has")
      result.size.should == 1
      result.first.name.should == :item2
    end

    it "finds matches if the text is not in order" do
      result = subject.search("has batman")
      result.size.should == 1
      result.first.name.should == :item2
    end
  end
end
