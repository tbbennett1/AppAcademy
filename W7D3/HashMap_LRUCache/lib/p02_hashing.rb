class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.join('').to_i.hash
  end
end

class String
  def hash
    output = ""
    alpha = ("a".."z").to_a
    self.each_char.with_index do |char, i|
      output += i.to_s + alpha.index(char).to_s
    end
    output.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    unless self.to_a.empty?
      self.to_a.flatten.join('').to_i.hash
    end
    self.length
  end
end
