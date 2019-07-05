

module Stepable


    def moves
        move_diffs.each_with_object([]) do |(dx, dy), moves|
                cur_x, cur_y = pos
                pos = [cur_x + dx, cur_y + dy]

                next if board.valid_pos?(pos) == false

                if board.empty?(pos)
                    moves << pos
    end


    private

    def move_diffs
        raise NotImplementedError
    end
end