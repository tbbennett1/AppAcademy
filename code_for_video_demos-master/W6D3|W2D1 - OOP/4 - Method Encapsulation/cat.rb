class Cat
  def initialize(name)
    @name = name
  end

  def introduce
    puts "#{name} meow"
  end

  def eat(food)
    puts "*#{name} eats the #{food}*"
  end

  def walk
    puts "*#{name} is walking*"
  end

  private
  attr_reader :name
end