require "benchmark"

# Anagrams
# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings

#-------------------------------------------------------------------------------------------
# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

def first_anagram?(str1, str2)
  str1.chars.permutation(str1.length).map(&:join).include?(str2)
end

# time: O(n!)
# space: O(n!)

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true




# No, the space complexity is "just" O(n! × n), since you don't simultaneously hold onto all recursive calls' permutationsOfRest / permutations. (You do have two at a time, but that's just a constant factor, so isn't relevant to the asymptotic complexity.)

# Note that if you don't actually need a List<String>, it might be better to wrap things up as a custom Iterator<String> implementation, so that you don't need to keep all permutations in memory at once, and don't need to pre-calculate all permutations before you start doing anything with any of them. (Of course, that's a bit trickier to implement, so it's not worth it if the major use of the Iterator<String> will just be to pre-populate a List<String> anyway.)


# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??



def second_anagram?(str1, str2)
  str2_ary = str2.chars
  str1.chars.each do |char|
    idx = str2_ary.find_index(char)
    str2_ary.delete_at(idx) unless idx.nil? 
  end
  str2_ary.empty?
end

# time: O
# space: O

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end


#time : O(n^2) 
#space : O(n*log(n))


# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

def fourth_anagram?(str1,str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.chars.each {|char| hash1[char] += 1}
  str2.chars.each {|char| hash2[char] += 1}
  hash1 == hash2
end

# What is the time complexity?
# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true
# Bonus: Do it with only one hash.
def fourth_anagram_bon?(str1,str2)
  hash1 = Hash.new(0)
  str1.chars.each {|char| hash1[char] += 1}
  str2.chars.each {|char| hash1[char] -= 1}
  hash1.values.all?(&:zero?)
end

# p fourth_anagram_bon?("gizmo", "sally")    #=> false
# p fourth_anagram_bon?("elvis", "lives")    #=> true
# Discuss the time complexity of your solutions together, then call over your TA to look at them.
word1 = ((('a'..'z').to_a*1000).shuffle).join
word2 = ((('a'..'z').to_a*1000).shuffle).join

Benchmark.bmbm do |x|
  #x.report("first_anagram?") {first_anagram?(word1, word2)}
  x.report("second_anagram?") {second_anagram?(word1, word2)}
  x.report("third_anagram?") {third_anagram?(word1, word2)}
  x.report("fourth_anagram?") {fourth_anagram?(word1, word2)}
  x.report("fourth_anagram_bon?") {fourth_anagram_bon?(word1, word2)}
end