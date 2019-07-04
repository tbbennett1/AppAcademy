

class Piece
    attr_accessor :color

    def initialize(color = nil)
        @color = color
        # @board = Board.new
    end

    def to_s
      " #{symbol} "
    end
end