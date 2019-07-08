class Piece
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color = nil, board, pos)
      raise 'invalid color' unless %i(white black).include?(color)
      raise 'invalid pos' unless board.valid_pos?(pos)

      @color = color
      @board = board
      @pos = pos

      board.add_piece(self, pos)
    end

    def to_s
      " #{symbol} "
    end

    def empty?
      false
    end
    
    def valid_moves
      moves.reject { |end_pos| move_into_check?(end_pos)} 
    end
    
    def pos=(val)
      @pos = val
    end

    def symbol
      raise NotImplementedError
    end 

    private

    def move_into_check?(end_pos)
      dup_board = board.dup
      dup_board.move_piece!(pos, end_pos)
      dup_board.in_check?(color)
    end


  end