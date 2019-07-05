
class Array
  def my_uniq
    arr = []
    self.each do |ele|
      arr << ele unless arr.include?(ele)
    end
    arr
  end

  def two_sum
    arr = []
    self.each_with_index do |ele1, i1|
      self.each_with_index do |ele2, i2|
        arr << [i1, i2] if i2 > i1 && ele1 + ele2 == 0
      end
    end
    arr
  end

end