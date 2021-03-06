class Animal
  include Walkable

  def initialize(name)
    @name = name
  end

  def eat(food)
    puts "*#{name} eats the #{food}*"
  end

  private
  attr_reader :name

end