require_relative 'piece'
require "colorize"

class Rook < Piece


    def symbol
      '♜'.colorize(color)
    end
    
end
