module Komainu
  class Match
    attr_reader :index, :text
    def initialize index, text
      @index = index
      @text = text
    end
  end
end
