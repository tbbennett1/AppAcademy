require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer

  def move(game, mark)
      new_node = TicTacToeNode.new(game.board, mark)

      possible_move = new_node.children.find { |child| child.winning_node?(mark) }
      return possible_move.prev_move_pos if possible_move

      op_mark = mark == :x ? :o : :x

      blocking_node = TicTacToeNode.new(game.board, op_mark)
      blocking_move = blocking_node.children.find { |child| child.winning_node?(op_mark) }
      return blocking_move.prev_move_pos if blocking_move

      raise "No winning or draw move"
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end

