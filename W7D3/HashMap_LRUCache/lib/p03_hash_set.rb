class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    unless self.include?(key)
      self[key.hash] << key.hash 
      @count += 1
    end
    resize! if @count > @num_buckets
  end

  def include?(key)
    self[key.hash].each { |el| return true if el == key.hash }
    false
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key.hash)
       @count -= 1
    end
  end
private
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




  # private




  