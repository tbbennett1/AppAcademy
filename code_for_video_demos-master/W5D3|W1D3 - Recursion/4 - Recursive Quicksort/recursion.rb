require 'byebug'

###############
# RECURSION   #
###############

# What is Recursion?


# What do we need to write a useful recursive method?
# 1. Base case
# 2. Inductive step




# return array containing the first n fibs
# [0, 1, 1, 2, 3, 5, 8]
def fibs(n)
  # return [] if n == 0
  # return [0] if n == 1
  # return [0, 1] if n == 2
  return [0, 1].take(n) if n <= 2

  # fibs(2) #=> [0, 1]
  prev_fibs = fibs(n - 1)
  last_num = (prev_fibs[-1] + prev_fibs[-2])
  prev_fibs << last_num
end



class Array
  # for convenience

  def quicksort
    return self.dup if self.length <= 1

    pivot = self.first #=> 2, -1
    left = self.drop(1).select { |el| el < pivot } #=> [-1, 0], []
    right = self.drop(1).select { |el| el >= pivot } #=> [], [0]

    sorted_left = left.quicksort #=> [-1, 0], []
    sorted_right = right.quicksort #=> [], [0]

    sorted_left + [pivot] + sorted_right
  end
end

[2, -1, 0].quicksort