a = [1, 1, 2, 2, 3]

i = 0
uniq_arr = []
while i < arr.length
    uniq_arr << arr[i] unless uniq_arr.include?(arr[i])
i += 1
end
uniq_arr

[1, 2, 3]


cou

nter = Hash.new(0)
    i = 0
    while i < arr.length
        counter[ arr[i] ] += 1
        i += 1
    counter.keys.select { |k, v| v = 1 }

[3]

# two sum

sum_arr = []
i = 0
while i < arr.length
    j = i + 1
    while j < arr.length
        sum_arr << (arr[i], arr[j]) if arr[i] + arr[j] == 0
        j += 1
    end
    i += 1
end

# transpose

nested = Array.new(self[0].length) { 
        Array.new (self.length) 
    }

nested = []
self.each_with_index do |subArr, i|

    

    subArr = []
    subArr.each_with_index do |arr, j|
        subArr << self[j][i]
    end
    nested << subArr
end
nested