# two_sum?
# Given an array of unique integers and a target sum, determine whether any two integers in the array sum to that amount.

def bad_two_sum?(arr, target_sum)
  target = false
  arr.combination(2) do |pair|
    target = true if pair.sum == target_sum
  end
  target
end

#time: O(2^n)
#space: O(2^n)

arr = [0, 1, 5, 7,11]  #12
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false


def ok_two_sum?(arr, target_sum)
  sorted = arr.sort
  mid = arr.length/2
  if arr[mid] + arr[mid - 1] < target_sum   #right
    ok_two_sum?(arr.drop(mid), target_sum)
  elsif arr[mid] >= target_sum              #left
    ok_two_sum?(arr.take(mid), target_sum)
  else
  end
end

#O(nlogn) linearithmic time
#O(n) linear space
# def okay_two_sum_a?(arr, target_sum)
#   arr = arr.sort
#   i, j = 0, arr.length - 1

#   while i < j
#     case (arr[i] + arr[j]) <=> target_sum
#     when 0
#       return true
#     when -1
#       i += 1
#     when 1
#       j -= 1
#     end
#   end

#   false
# end

#time:
#space:
# arr = [0, 1, 5, 7]
# p ok_two_sum?(arr, 6) # => should be true
# p ok_two_sum?(arr, 10) # => should be false


def hash_two_sum?(arr, target_sum)
  hash = {}
  arr.each do |el|
    num = target_sum - el
    return true if hash[num]
    hash[el] = num
  end
  false
end

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false