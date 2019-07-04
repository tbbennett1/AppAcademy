require "byebug"
require_relative "pieces"

class Board
    attr_reader :rows

    def initialize
        # @nullpiece = NullPiece.instance
        board_setup
    end

    def board_setup
        @rows = Array.new(8) {Array.new(8, NullPiece.instance)}
        @rows.each_with_index {|piece, i| @rows[1][i] = Pawn.new(:black)}
        @rows.each_with_index {|piece, i| @rows[6][i] = Pawn.new(:white)}
        blackpiece_arr = [Rook.new, Knight.new, Bishop.new, Queen.new, King.new, Bishop.new, Knight.new, Rook.new]
        whitepiece_arr = [Rook.new, Knight.new, Bishop.new, Queen.new, King.new, Bishop.new, Knight.new, Rook.new]
        blackpiece_arr.each_with_index do |piece, i|
            piece.color = :black
            @rows[0][i] = piece
        end
        whitepiece_arr.each_with_index do |piece, i|
            piece.color = :white
            @rows[7][i] = piece
        end
    end

    def [](pos)                 #pos => [0,1]   board = Board.new  board[pos]
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)  
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        piece = self[start_pos]
        if piece == nil
            raise "There isn't a piece there Chief!"
        elsif !piece.valid_moves.include?(end_pos)   #valid moves array???
            raise "You can't move there Chief!"
        else  
            self[end_pos] = piece 
        end
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
