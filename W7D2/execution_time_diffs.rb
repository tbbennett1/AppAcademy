# my_min
# Given a list of integers find the smallest number in the list.

# Example:




# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(list)
  min = 0
  list.each do |ele1|
    min = ele1 if list.all? do |ele2|
      ele1 <= ele2
    end
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5 O(n^2)

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?

def my_min2(list)
  min = list.shift
  list.each do |ele|
    min = ele if ele < min
  end
  min
end

# p my_min2(list) #=> -5  O(n)


# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Example:


#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7




# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

def largest_contiguous_subsum(lst)
  subary = []
  (1..lst.size).each do |window_size|
    lst.each_cons(window_size) do |window|
      subary << window
    end
  end

  subary.max {|a, b| a.sum <=> b.sum }.sum
end


# Discuss the time complexity of this solution.
#time O(n^2)
#space O(n)

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum.

list = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]


def largest_contiguous_subsum2(lst)
  largest = lst.first
  current_sum = lst.first
  lst.drop(1).each do |num|             #window_size = [1,2,3...lst.length]
    if current_sum <= 0 && num > current_sum
      current_sum = num
    else  
      current_sum += num
    end

    largest = current_sum if current_sum > largest
  end
  
  largest
end


p largest_contiguous_subsum2(list) # => 8
p largest_contiguous_subsum2(list2) # => 8 (from [7, -6, 7])
p largest_contiguous_subsum2(list3) # => -1 (from [-1])

#time: O(n)
#space: O(1)
# Get your story straight, and then explain your solution's time complexity to your TA.