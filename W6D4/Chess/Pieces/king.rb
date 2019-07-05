require_relative "piece"

class King < Piece
  def symbol
    '♚'.colorize(color)
  end

    protected

    def move_diffs

    end
end