class Array
  def merge_sort
    return self if self.length < 2

    middle = self.length / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    self.class.merge(sorted_left, sorted_right)
  end

          [8, 7, 6, 5, 4, 3, 2, 1]
          [8, 7, 6, 5] [4, 3, 2, 1]
          [7, 8] [6, 5] [4, 3] [2, 1]
        [8] [7] [6] [5] [4] [3] [2] [1]

  # log2(n) "levels"
  # at each level:
  #    n work in creating halves
  #    n work in merging halves
  O(n*log(n))

  log(n) "levels" * n "half-arrays" + log(n)
  O(n * log(n))


  def self.merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array << ((left.first < right.first) ? left.shift : right.shift)
    end

    merged_array + left + right
  end
end