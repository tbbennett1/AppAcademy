

module Slidable

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        move_dirs.each do |dx, dy|
            moves.concat(grow_unblocked_moves_in_dir(dx, dy))
        end
    end

  private
  
    HORIZONTAL_DIRS = [[0, 1],
                      [0, -1],
                      [1, 0],
                      [-1,0]]
    DIAGONAL_DIRS = [[1, 1],
                    [1, -1],
                    [-1, 1],
                    [-1, -1]]

    def move_dirs
        raise NotImplementedError
    def

    def grow_unblocked_moves_in_dir(dx, dy)
        cur_x, cur_y = pos
        moves = []
        loop do 
            cur_x, cur_y = cur_x + dx, cur_y + dy
            pos = [cur_x, cur_y]
            break unless board.valid_pos?(pos)

            if board.empty?(pos)
                moves << pos
            else
                moves << pos if board[pos].color != color
                break
            end
        end
        moves
    end

end