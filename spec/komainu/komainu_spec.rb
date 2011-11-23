require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))
require "komainu/komainu"
module Komainu
  describe Komainu do
    it "searches" do
      item = OpenStruct.new
      item.text = "hello"
      Komainu.search("hello", [item]).must_be_kind_of SearchResults
    end
  end
end
