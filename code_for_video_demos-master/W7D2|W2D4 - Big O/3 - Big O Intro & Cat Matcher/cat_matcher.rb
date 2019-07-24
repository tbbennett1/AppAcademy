require 'faker'

class Cat
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def assess
      @score = rand(10)
      sleep(0.5)
    end
  
    def compare(other_cat)
      sleep(0.05)
    end
  end

  # num_cats  assessing  comparison
  #   2          1s         0.2s
  #   10         5s         5s
  #   100        50s      500s
  
  def cat_compatibility_algorithm(all_cats)
    puts "Assessing cats..."
  
    before_assessment_time = Time.now
    all_cats.each { |cat| cat.assess } #=> O(n)
  
    puts "Catssessments completed in #{(Time.now - before_assessment_time)}s"
  
    puts "Comparing cats..."
    before_compare_time = Time.now
    all_cats.each_with_index do |cat_1, i|
      all_cats.drop(i + 1).each do |cat_2|
        next if cat2 == cat1 #=> O(n*(n-1)/2) O(n^2/2-n/2) O(n^2)
        cat_1.compare(cat_2)
      end
    end #=> O(n^2)
    [1,2,3,4]

  
    puts "Cat comparisons completed in #{(Time.now - before_compare_time)}s"
  end
  
  cats = []
  2.times do
    cats << Cat.new(Faker::Cat.name)
  end

  print "Today's candidates are: "
  puts cats.map(&:name).join(", ")
  print "\n"
  
  cat_compatibility_algorithm(cats)