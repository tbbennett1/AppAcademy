require 'byebug'

class Pet
  
  def initialize(name)
    @name = name
  end

end

class Dog < Pet

  def self.dog_count
    @dog_count || 0
  end

  def self.record_dog_birth
    @dog_count ||= 0
    @dog_count += 1
  end

  def initialize(name)
    super(name)
    @secret = "Goat in disguise"
    self.class.record_dog_birth
  end

  def sleep
    puts "sleeping"
  end

  def eat
    puts "eating"
  end

  def drink
    puts "drinking"
  end

  def juggle(thing, num)
    num.times do
      puts "juggling #{ thing }"
    end
  end

  private

  def tell_secret
    puts "My secret is: #{ @secret }"
  end
end