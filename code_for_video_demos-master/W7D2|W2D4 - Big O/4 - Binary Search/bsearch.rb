class Array
    def slow_search(target)
      self.each_with_index do |el, i|
        puts 'Slowly searching...'
        return i if target == el
      end
      nil
    end # O(n)
  
    def bsearch(target)
      puts 'Bsearching...'
      return nil if self.empty?
  
      probe_index = self.length / 2
      case target <=> self[probe_index]
      when -1
        self.take(probe_index).bsearch(target)
      when 0
        probe_index
      when 1
        sub_answer = self.drop(probe_index + 1).bsearch(target)
        sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
      end
    end

    def iter_bsearch(target)
      start_i = 0
      end_i = self.length - 1
      probe_index = self.length / 2

      until start_i == end_i
        case target <=> self[probe_index]
        when -1
          end_i = probe_index
          probe_index = (start_i + end_i) / 2
        when 0
          return probe_index
        when 1
          start_i = probe_index
          probe_index = (start_i + end_i) / 2
        end
      end
    end
  end

  [2, 3, 4, 5, 6, 8, 10, 11]
  [2, 3, 4, 5]
  [2, 3]
  [2]
  # O(n)

  # 3*log2(n)
  # O(log(n))

  # 2^3 = 8
  # 2^x = 8
  # log2(8) = 3

