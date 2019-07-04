require_relative "piece"

class King < Piece
  def symbol
    '♚'.colorize(color)
  end
end