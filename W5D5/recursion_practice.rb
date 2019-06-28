require "byebug"

# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(start, stop)
  arr = []
  return arr if start >= stop
  arr += [start] + range(start + 1, stop)
end

# p range(1, 5) #=> [1,2,3,4]
# p range(3, 15) #=> [3,4,5,6,7,8,9,10,11,12,13,14]
# p range(100, 500) 


#EXPONENTIATION
def exp1(b, n)
  return 1 if n == 0
  b * exp1(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exp2(b, n/ 2) ** 2
  else  
    b * (exp2(b, (n - 1) / 2) ** 2)
  end
end

# p exp1(3, 3)  #=> 27
# p exp1(2, 4)  #=> 16
# p exp2(3, 3)  #=> 27
# p exp2(2, 4)  #=> 16


#DEEP_DUP
def deep_dup(array)
  array.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# # shal_dup = robot_parts.dup
# # deep_duplicate = deep_dup(robot_parts)
# # deep_duplicate[1] << "LEDs"
# # p deep_duplicate
# # p robot_parts
# # shal_dup[0] << "screws"
# # p shal_dup
# # p robot_parts


#FIB
def rec_fib(n)
  return [0,1].take(n) if n <= 2
  prev = rec_fib(n - 1)
  prev << prev[-2] + prev[-1]
  prev
end

def iter_fib(n)
  fibs = []
  (0...n).each do |i|
    if i == 0 || i == 1
      fibs << i
    else  
      fibs << fibs[-2] + fibs[-1]
    end
  end
  fibs
end

# p rec_fib(4)
# p rec_fib(5)
# p rec_fib(10)
# p iter_fib(4)
# p iter_fib(5)
# p iter_fib(10)


#BINARY SEARCH
def bsearch(array, target)
  return nil if array.length == 0
  midpoint = array.length / 2
  left = array.take(midpoint)
  right = array.drop(midpoint + 1)

  case target <=> array[midpoint]
  when -1
    return bsearch(left, target)
  when 0
    return midpoint
  when 1
    res = bsearch(right, target)
    res.nil? ? nil : midpoint + 1 + res
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


#MERGE SORT
def merge_sort(array, &prc)
  return array if array.length <= 1
  mid = array.length / 2
  left = array.take(mid)
  right = array.drop(mid)
  merged_left = merge_sort(left, &prc)
  merged_right = merge_sort(right, &prc)

  merge(merged_left, merged_right, &prc)
end

def merge(left, right, &prc)
  prc ||= Proc.new { |a, b| a <=> b }
  merged = []
  until left.empty? || right.empty?
    if prc.call(left.first, right.first) == -1
      merged << left.shift
    else  
      merged << right.shift
    end
  end

  merged + left + right
end

# arr1 = [4,2,8,1]
# arr2 = [8,3,6,1,5,0,3,7,3,4]
# p merge_sort(arr1)
# p merge_sort(arr2)
# p merge_sort(arr1) { |a, b| b <=> a }
# p merge_sort(arr2) { |a, b| b <=> a }


#Subsets
def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr[0...-1])
  subs.concat(subs.map { |x| x += [arr.last]})
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])  # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


#PERMUTATIONS
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

def permutations(array)
  return [array] if array.length <= 1
  first = array.shift
  perms = permutations(array)
  all_perms = []
  p perms
  perms.each do |perm|
    (0..perm.length).to_a.each do |i|
      all_perms << perm[0...i] + [first] + perm[i..-1]
    end
  end
  all_perms
end

# p permutations([1])     # => [1]
# p permutations([1,2])   # => [[1,2], [2,1]]
# permutations([1, 2, 3,4,5]) # => [[1, 2, 3], [1, 3, 2],
#                           #     [2, 1, 3], [2, 3, 1],
#                           #     [3, 1, 2], [3, 2, 1]]


# Write a recursive method to solve `make better change`.

# HINT: To make_better_change, we only take one coin at a time and
# never rule out denominations that we've already used.
# This allows each coin to be available each time we get a new remainder.
# By iterating over the denominations and continuing to search
# for the best change, we assure that we test for 'non-greedy' uses
# of each denomination.


def make_greedy_change(amount, coins = [25,10,5,1])
  sorted_coins = coins.sort.reverse
        
  change = sorted_coins.map do |coin| 
    f = amount/coin
    amount %= coin; 
    Array.new(f){coin}
  end

  change.flatten

  end

p make_greedy_change(67)


# make_better_change(24, [10,7,1]) #[10,7,7]
