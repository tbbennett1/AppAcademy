require_relative 'treenode'
require "byebug"

class KnightPathFinder
  attr_reader :start_pos

  MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def self.valid_moves(pos)
    valid_moves = []

    cur_x, cur_y = pos
    MOVES.each do |(dx, dy)|
      new_pos = [cur_x + dx, cur_y + dy]

      if new_pos.all? { |coord| coord.between?(0, 7) }
        valid_moves << new_pos
      end
    end

    valid_moves
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]

    build_move_tree
  end

  def find_path(end_pos)
    end_node = @root_node.dfs(end_pos)
    raise "Square doesn't exist" if end_node.nil?
    trace_path_back(end_node)
  end

  # private_constant :MOVES

  # private

  attr_accessor :root_node, :considered_positions

  def build_move_tree
    # debugger
    self.root_node = TreeNode.new(start_pos)

    nodes = [root_node]
    until nodes.empty?
      current_node = nodes.shift

      current_pos = current_node.value
      new_move_positions(current_pos).each do |next_pos|
        next_node = TreeNode.new(next_pos)
        current_node.add_child(next_node)
        nodes << next_node
      end
    end
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos)
      .reject { |new_pos| considered_positions.include?(new_pos) }
      .each { |new_pos| considered_positions << new_pos }
  end

  VISITED = []

  def trace_path_back(end_node)
  
    if end_node != @root_node # root_node.children.include?(end_node)
      VISITED.push(end_node)
    else
      VISITED.push(root_node)
      return VISITED.reverse
    end
    
    new_end_node = end_node.parent
    trace_path_back(new_end_node)
  end

end

if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new([0,0])
  p kpf.find_path([6,2])
end




