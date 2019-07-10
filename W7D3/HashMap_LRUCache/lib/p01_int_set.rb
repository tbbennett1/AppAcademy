require "byebug"

class MaxIntSet

  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private
  

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end


  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num 
      @count += 1
    end
    self.resize! if @count > @num_buckets
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
       @count -= 1
    end
  end

  def include?(num)
    self[num].each { |el| return true if el == num }
    false
  end

  # private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    copy_store = @store
    @count = 0
    @num_buckets *= 2      
    @store = Array.new(@num_buckets) { Array.new } 
    copy_store.each do |bucket|
      bucket.each { |el| self.insert(el) }
    end

    @store
  end
end
