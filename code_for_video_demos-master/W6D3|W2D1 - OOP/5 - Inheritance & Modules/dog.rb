class Dog < Animal
  
  def initialize(name, favorite_treat)
    super(name)
    @favorite_treat = favorite_treat
  end

  def introduce
    puts "#{name} bork bork"
  end

  def fetch(item)
    puts "*#{name} excitedly fetches #{item} and wants you to throw it again*"
  end

  def sniff(other_dog)
    puts "*#{name} sniffs #{other_dog.name}'s butt. interesting.*"
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