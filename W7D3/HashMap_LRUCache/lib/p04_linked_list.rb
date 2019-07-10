class Node
  attr_accessor :val, :next, :prev, :key

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = @head
    until current_node == @tail.prev
      if current_node.next.key == key
        return current_node.next.val
      else 
        current_node = current_node.next
      end
    end
   nil
  end

  def include?(key)
  end

  def append(key, val)
    new = Node.new(key, val)
    @tail.prev.next = new
    @tail.prev = new
  end

  def update(key, val)
    current_node = @head
    until current_node == @tail.prev
      if current_node.next.key == key
        current_node.next.key = val
      else 
        current_node = current_node.next
      end
    end
    
  end

  def remove(key)
  end

  def each
    
  end

  # def inspect
  #   @val = val.inspect
  # end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
