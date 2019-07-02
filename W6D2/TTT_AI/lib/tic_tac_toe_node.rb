require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
   attr_accessor :prev_move_pos, :board, :next_mover_mark

  def initialize(board, mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = mark #:x,:o
    @prev_move_pos = prev_move_pos 
  end

  def losing_node?(evaluator) #evaluator is human_player-:x or computer_player-:o
    !winning_node?(evaluator)  
  end

  def winning_node?(evaluator) # board_node.winning_node?(:x)
    if @board.over?
      return @board.winner == evaluator
    else  
      if next_mover_mark == evaluator
        self.children.any? do |child| 
          child.winning_node?(evaluator)
        end
      else  
        self.children.all? do |child|
          child.winning_node?(evaluator)
        end
      end      
    end
  end

  def children
    # debugger
    positions = []
    (0..2).each do |x|
      (0..2).each do |y|
        new_board = @board.dup
        pos = [x, y]

        if new_board[pos].nil? && !new_board.over?
          new_board[pos] = next_mover_mark
          
          positions << TicTacToeNode.new(new_board, (next_mover_mark == :o ? :x : :o), pos)
        end
      end
    end
    positions
  end
  
end