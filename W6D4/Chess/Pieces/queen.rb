require_relative "piece"

class Queen < Piece

    # def symbol
    #     @symbol = "♕"
    # end

    def symbol
    '♛'.colorize(color)
    end
end