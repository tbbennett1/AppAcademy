require "byebug"
require_relative "piece"

class Board
    attr_reader :rows

    def intialize
        @rows = rows
        board_setup
    end

    def board_setup
        @rows = Array.new(8) {Array.new(8, NullPiece.new)}
        # debugger
        @rows[2].each_with_index {|piece, i| self[i] = Pawn.new("black")}
        @rows[7].each_with_index {|piece, i| self[i] = Pawn.new("white")}
        # black_king = King.new("black")
    end

    def [](pos)                 #pos => [0,1]   board = Board.new  board[pos]
        row, col = pos
        rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)

    end

    def valid_pos?(pos)

    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces

    end

    def dup

    end

    def move_piece!(color, start_pos, end_pos)

    end

    def inspect
        @value = value
    end

    private

    def sentinal
        @sentinal = NullPiece
    end
end
