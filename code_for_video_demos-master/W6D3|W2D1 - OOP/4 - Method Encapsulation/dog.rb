class Dog
  def initialize(name)
    @name = name
  end

  def introduce
    puts "#{name} bork bork"
  end

  def fetch(item)
    puts "*#{name} excitedly fetches #{item} and wants you to throw it again*"
  end

  def eat(food)
    puts "*#{self.name} eats the #{food}*"
  end

  def sniff(other_dog)
    self

    puts "*#{name} sniffs #{other_dog.name}'s butt. interesting.*"
  end

  def walk
    puts "*#{name} is walking*"
  end

  # def rename(new_name)
  #   # name = new_name
  #   self.name = new_name
  # end

  protected
  attr_reader :name
  # def name
  #   @name
  # end
  # def name=(new_name)
  #   @name = new_name
  # end
  

end