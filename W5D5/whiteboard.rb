def bsearch(sorted_arr, target)
    return nil if sorted_arr.length == 0

    middle_index = sorted_arr.length / 2
    middle = sorted_arr[middle_index]
    left = sorted_arr[0...middle_index]
    right = sorted_arr[middle_index + 1..-1]

    if target == middle 
        return middle_index
    elsif target < middle
        bsearch(left, target)
    else
        bsearch(right, target).nil? ? nil : bsearch(right, target) + 1 + left.length
    end

end


#merge sort that takes a prc. should not modify original array. Array class monkey patching
#[1,2,3,4,5]
class Array
  def merge_sort(&prc)
    return self if length <= 1

    pivot = length / 2
    left = self.take(pivot) # self[0...pivot]
    right = self.drop(pivot) # self[pivot..-1]

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)

    merge(sorted_left, sorted_right, &prc) 
  end

  def merge(left, right, &prc)
    merged = []
    prc ||= Proc.new { |a, b| a <=> b }
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged + left + right
  end
end

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end
end


#my_flatten to specified level Monkey Patch
#  [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]
class Array
  def my_flatten(level = 0)
    # return self if level == 0
    duplicate = self.dup  
    new_arr = []
    
    return duplicate if level == 0
    # next_level = level ? level - 1 : 0
    
    duplicate.each_with_index do |el, i|
      if el.is_a?(Array)
        new_arr += el.my_flatten(level - 1)
      else
        new_arr << el
      end
    end

    new_arr
  end
end

# 0! => 1       
# 1! => 1
# 2! => 2 * 1! => 2 * 1
def factorials_rec(n) 
    return [1] if n == 0                    
    return [1,1] if n == 1                  

    previous = factorials_rec(n - 1)  
    previous << n * previous[-1]
end


#array method inject
class Array

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift

    each_with_index do |el, i|
      accumulator = prc.call(accumulator, el)
    end

    accumulator
  end

end

#### Digital Root

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**

# You may wish to use a helper function, `digital_root_step(num)` which performs one step of the process.
# 4424 => 4 + 4 + 2 + 4 => 14 > 10 => 5  145 => 1 + 4 + 5 => 19 => 1 + 9 => 10 
def digital_root(num)    
    until num <= 10
        num = (num / 10) + (num % 10) 
    end
    num
end


### Shuffled Sentences

# This method returns true if the words in the string can be rearranged to form the
# sentence passed as an argument. Words are separated by spaces.

# Example:

# ```ruby
# "cats are cool".shuffled_sentence_detector("dogs are cool") => false
# "cool cats are".shuffled_sentence_detector("cats are cool") => true
class String
  def shuffled_sentence_detector(string)
    arr = string.split(" ")
    arr.all? {|word| self.include?(word)}
  end
end

### Jumble Sort

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:

# ```rb
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, arr = nil)
    arr ||= ("a".."z").to_a
    sorted_str = ""

    arr.each do |el|
        if str.include?(el)
            str.count(el).times do 
                sorted_str += el 
            end
        end
    end
    sorted_str
end


# Alternately:

# def jumble_sort(str, alphabet = nil)
#   alphabet ||= ('a'..'z').to_a

#   sorted_chars = str.chars.sort do |chr1, chr2|
#     alphabet.index(chr1) <=> alphabet.index(chr2)
#   end

#   sorted_chars.join
# end

#fibonaci array


# Write a method that finds the first `n` Fibonacci numbers recursively.
# [0,1,1,2,3,5]
   1 2 3
def fib_rec(n)
  return [0,1].take(n) if n <= 2
  prev = fib_rec(n - 1)
  prev << prev[-2] + prev[-1]
end

### Largest Prime Factor

# Write a method that returns the largest prime factor of a number. We recommend writing a `is_prime?` helper method.

def largest_prime_factor(num)
    factors = (1..num).select { |factor| num % factor == 0}
    factors.select { |el| is_prime?(el) }.max
end

def is_prime?(n)
    return false if n < 2
    (2...n).none? { |factor| n % factor == 0}
end

def largest_prime_factor(num)
  num.downto(2) do |factor|
    if (num % factor).zero?
      return factor if prime?(factor)
    end
  end

  nil
end

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]

#permutations([1,2]) => [[1,2],[2,1]]
def permutations(arr)
  return arr if arr.length <= 1

    new_arr = []
  (0...arr.length).each do |i|    # 0 1 2
    new_arr << [arr[i] += arr[0...i] += arr[i + 1..-1]]     [[1,2,3],[2,1,3],[3,1,2,3]]
    
  end

end


#Fib_sum 
def fib_sum(n, fibs = [1,1])
  return n if n <= 2
  return fibs.sum if fibs.length == n  
  next_num = fibs[-1] + fibs[-2]
  next_fibs = fibs << next_num
  fib_sum(n, next_fibs)
end
