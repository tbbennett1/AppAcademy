require_relative "piece"

class Bishop < Piece

  def symbol
    '♝'.colorize(color)
  end
end