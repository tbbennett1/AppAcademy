require "singleton"
require_relative "piece"

class NullPiece < Piece
    include Singleton
    
    attr_reader :symbol
    
    def initialize
      @symbol = " "
      @color = :none
    end
end