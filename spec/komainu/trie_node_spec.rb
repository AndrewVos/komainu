require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))
require "komainu/trie_node"

module Komainu
  describe TrieNode do
    it "stores a word" do
      trie_node = TrieNode.new
      trie_node.insert("abc")
      trie_node.children["a"].wont_be_nil
      trie_node.children["a"].children["b"].wont_be_nil
      trie_node.children["a"].children["b"].children["c"].wont_be_nil
    end

    it "stores multiple words" do
      trie_node = TrieNode.new
      trie_node.insert("ac")
      trie_node.insert("ad")
      trie_node.children["a"].children["c"].wont_be_nil
      trie_node.children["a"].children["d"].wont_be_nil
    end

    it "sets the last node word" do
      trie_node = TrieNode.new
      trie_node.insert("ac")
      trie_node.children["a"].children["c"].word.must_equal "ac"
    end
  end
end
