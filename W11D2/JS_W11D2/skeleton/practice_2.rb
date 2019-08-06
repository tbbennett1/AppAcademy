# self.each do { |el| el + 1 }

# i = 0
# while i < self.length
#     self[i] + 1
#     i += 1
# end

[1, 2, 3].inject(10) { |el, acc| el + acc }
=> 16