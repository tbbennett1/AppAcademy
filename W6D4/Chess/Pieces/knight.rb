require_relative "piece"

class Knight < Piece
  def symbol
    '♞'.colorize(color)
  end

    protected

    def move_diffs

    end
end