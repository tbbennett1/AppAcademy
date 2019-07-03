

class Piece


    def initialize(color = nil)
        @color = color
        # @board = Board.new
    end
end

class Rook < Piece

    def symbol
        @symbol = :R
    end
end

class Bishop < Piece

    def symbol
        @symbol = :B
    end
end

class Queen < Piece

    def symbol
        @symbol = :Q
    end
end

class King < Piece

    def symbol
        @symbol = :K
    end
end

class Knight < Piece

    def symbol
        @symbol = :N
    end
end

class Pawn < Piece
    def symbol
        @symbol = :P
    end
end

class NullPiece < Piece
    
    def symbol
        @symbol = :O
    end
end