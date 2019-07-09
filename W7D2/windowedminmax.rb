def windowed_max_range(ary,window_size)

  range = nil
  ary.each_cons(window_size) do |window|
    minmax = window.max - window.min
    if range.nil? || range < minmax 
      range =  minmax
    end
  end
  
  range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8