require_relative "piece"

class Knight < Piece
  def symbol
    '♞'.colorize(color)
  end
end