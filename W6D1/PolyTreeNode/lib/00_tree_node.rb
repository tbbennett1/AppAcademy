class PolyTreeNode
  attr_reader :parent, :value, :children
  def initialize(value)
      @value = value
      @parent = nil
      @children = []
  end

  def parent=(new_parent)
    parent.children.delete(self) unless self.root_node?
    @parent = new_parent
    new_parent.children << self unless new_parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
    self.children << child_node if !self.children.include?(child_node)
    child_node
  end

  def remove_child(child_node)
    if children.include?(child_node)
      child_node.parent = nil
    else
      raise "Error! BadParent!"
    end
  end

  def root_node?
    parent.nil?
  end

  def inspect
    @value.inspect
  end

  def dfs(target)
    return self if @value == target
    @children.each do |child|
      result = child.dfs(target)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target)
    queue = []
    queue.push(self) 
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target
      
      current_node.children.each do |child|
        queue.push(child)
      end
    end
    nil
  end
    
end



