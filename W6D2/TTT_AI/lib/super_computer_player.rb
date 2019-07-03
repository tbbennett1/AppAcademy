require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer

  def move(game, mark)
      new_node = TicTacToeNode.new(game.board, mark)

      win_node = new_node.children.find { |child| child.winning_node?(mark) }
      return win_node.prev_move_pos if win_node

      block_node = new_node.children.find { |child| !child.losing_node?(mark)}
      return block_node.prev_move_pos if block_node

      raise "No winning or draw move"
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end

