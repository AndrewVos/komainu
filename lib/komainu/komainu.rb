module Komainu
  def self.search text, searchables
    SearchesText.new(searchables).search(text)
  end
end
