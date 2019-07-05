

class Piece
    attr_accessor :color

    def initialize(color = nil, board)
        @color = color
        @board = board
        @pos = []
    end

    def to_s
      " #{symbol} "
    end

    def empty?

    end
    
    def valid_moves
      
    end
    
    def pos=(val)
      @pos = val
    end

    def symbol

    end 

    private

    def move_into_check?(end_pos)

    end


  end