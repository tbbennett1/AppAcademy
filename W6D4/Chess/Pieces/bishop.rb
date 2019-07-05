require_relative "piece"

class Bishop < Piece

  def symbol
    '♝'.colorize(color)
  end

      protected

    def move_dirs

    end
end