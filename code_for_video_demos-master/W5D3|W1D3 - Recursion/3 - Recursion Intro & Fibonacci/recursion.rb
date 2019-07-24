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
  end
end

# Any iterative algorithm can be written recursively, and any iterative
# algorithm can be written recursively
class Array
  def my_each(&prc)
    self.length.times { |i| prc.call(self[i]) }
    self
  end

  def my_each_rec(&prc)
    prc.call(self.first)

    # ...
  end
end