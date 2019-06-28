#enumerables

class Array

  def my_each(&prc)  # { |num| num > 1 }
    count = 0
    until count == self.length
      prc.call(self[count])   # { |num| num > 1 }
      count += 1
    end
    self
  end

  def my_select(&prc) 
    my_array = []
    self.my_each do |num| 
      my_array << num if prc.call(num)
    end
    my_array
  end

  def my_reject(&prc)
    my_array = []
    self.my_each do |num|
        my_array << num unless prc.call(num)
    end
    my_array
  end

  def my_any?(&prc)
    self.my_each do |ele|
        return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false if !prc.call(ele)
    end
    true
  end

  def my_flatten
    # return [self] if !self.is_a?(Array)            # return self[0] not-array
    my_array = [] 
    self.my_each do |ele|
         if !ele.is_a?(Array)
             my_array << ele 
         else
            my_array += ele.my_flatten # [4, [5, 6]], [[[7]], 8]
         end
    end
    my_array
  end

  def my_zip(*args)
    final_result = []
    count = 0
    while count < self.length
      result = []
      result << self[count]
      args.my_each do |subarr|
        result << subarr[count]
      end
      final_result << result
      count += 1
    end
    final_result
  end

  def my_rotate(num = 1)
    num.abs.times do
      if num > 0
        first = self.shift
        self.push(first)
      else
        last = self.pop
        self.unshift(last)
      end 
    end
    self
  end

  def my_join(separator = "")
    output = ""
    self.my_each do |char|
        output += char + separator
    end
    last_idx = output.length - separator.length
    output[0...last_idx]
  end

  def my_reverse 
    output = []
    until self.empty?
        output << self.pop
    end
    output
  end

  def bubble_sort!(&prc)   # <=>  or true false 
    sorted = false
    while !sorted
      sorted = true
      index = 0
      self.my_each do |el_1|
        next_index = index + 1
        el_2 = self[next_index]
        if prc.call(el_1,el_2) == 1
            self[index], self[next_index] = self[next_index], self[index]
            sorted = false
        end
        index += 1
      end
    end
    self
  end

  def bubble_sort(&prc)
    res_arr = self[0..-1]
    res_arr.bubble_sort!(&prc)
    res_arr
  end

end  # end of Array class

def factors(num)
  factor_arr = []
  (1..num).each do |i|
    factor_arr << i if num % i == 0
  end
  factor_arr
end

def substrings(string)
  output = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      output << string[i..j]
    end
  end
  output
end

def subwords(word, dictionary)
  result = []
  output = substrings(word)
  output.my_each do |i|
    result << i if dictionary.include?(i) && !result.include?(i)
  end
  result
end

# dictionary = ["bears", "ear", "a", "army"]
# p words = subwords("erbearsweatmyajs", dictionary) #["bears", "ear", "a"])


# string = "banana"
# p substrings(string)


# a = [4, 2, 3, 7, 5, 9, 1, 8, 2]
# p a.bubble_sort { |a, b| a <=> b }
# p a

# p factors(12)   #=> [1, 2, 3, 4, 6, 12]

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d", "e", "f", "g" ]
# p a.my_join         # => "abcd"
# p a.my_join("$$$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]



# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8] asdf
# p [[[5]]].my_flatten  # => []

#a = [1, 2, 3, 4, 5]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num.even? } # => []

# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


