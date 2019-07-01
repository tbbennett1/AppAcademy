require_relative 'treenode'
require "Set"
require "byebug"

class KnightPathFinder

  attr_accessor :root, :board

  def self.valid_moves(pos)
    valids = [[2, 1], [1, 2], [-1, 2], [-2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]]
    valids.include?(pos)
  end

  def initialize(start_pos, x = 8, y = 8)
    @board = build_board(x,y)
    @root = find_start(start_pos)
    build_move_tree
  end

  def find_path(target_pos)
    @root.bfs(target_pos).path
  end

  def build_board(x=8, y=8)
    board =[]
    y.times do |y_coor|
      x.times do |x_coor|
        board << TreeNode.new([x_coor, y_coor],nil)
      end
    end
    board
  end

  def build_move_tree

  end

  def new_move_positions(pos)
    #debugger
     x, y = pos #[0,0]
     valid_squares = []
     valids = [[2, 1], [1, 2], [-1, 2], [-2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]]
     valids.each do |offset|
        new_pos = [x + offset[0], y + offset[1]]
        @board.each do |square|
          valid_squares << square if square.value == new_pos
        end
      end
      valid_squares
  end

  def find_start(start_pos)
    #debugger
    @board.each do |square|
        return square if square.value == start_pos
    end
      raise ("Invalid starting position")
  end

end