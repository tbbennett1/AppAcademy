require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.first
    self.each_with_index do |el, i|
      prc.call(accumulator, el)
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).none? {|div| num % div == 0}
end

def primes(num)
  arr = []
  i = 0
  while arr.length < num
    if is_prime?(i)
      arr << i   
    end
    i += 1
  end
  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return 1 if num == 0
  return 1 if num == 1 
  facts = []
  i = 1
  while i < num
    individual_factorial = i * factorials_rec(i)
    facts << individual_factorial
    i += 1
  end
  facts

end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h, k| h[k] = []}
    self.each_with_index do |num, i|
      hash[num] << i   
    end
    hash.select { |k, v| v.length > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subs = []
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        subs << self[i..j]
      end
    end
    pals = []
    subs.each do |str|
      if str.length >= 2 && str == str.reverse
        pals << str  
      end
    end

    pals
  end

end



class Array

  # Write an Array#merge_sort method; it should not modify the original array.

def merge_sort(&prc)
    return self if length < 2
    mid = length / 2

    left = self.take(mid)
    right = self.drop(mid)

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, prc)
  end

  private
  def self.merge(left, right, prc)
    if prc.nil?
      prc = Proc.new { |el1, el2| el1 <=> el2 }
    end

    merged_arr = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        merged_arr << left.shift
      else  
        merged_arr << right.shift
      end
    end
    merged_arr + left + right
  end
end
