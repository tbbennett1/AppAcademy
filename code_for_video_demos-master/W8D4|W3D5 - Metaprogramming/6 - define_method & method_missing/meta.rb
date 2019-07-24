require 'byebug'

class Pet
  
  def self.record_pet_birth
    @@pet_count ||= 0
    @@pet_count += 1
  end

  def initialize(name)
    @name = name
    self.class.record_pet_birth
  end

end

class Dog < Pet

  def self.print_stats
    puts "Dogs: #{ self.dog_count } | All pets: #{ @@pet_count }"
  end

  def self.dog_count
    @dog_count || 0
  end

  def self.record_dog_birth
    @dog_count ||= 0
    @dog_count += 1
  end

  def self.learn_paw
    puts self
    define_method(:paw) do
      puts self
      puts "#{ @name } is giving paw"
    end
  end

  def self.learn_tricks(*tricks)
    tricks.each do |trick|
      define_method(trick) do |num_times = 1|
        num_times.times do 
          puts "#{ @name } is #{ trick }ing"
        end

        nil
      end
    end
  end

  self #=> Dog class
  self.learn_tricks(:fetch)
  learn_tricks :fetch, :play_dead, :roll_over


  def initialize(name)
    super(name)
    @secret = "Goat in disguise"
    self.class.record_dog_birth
  end

  def method_missing(method_name, *args)
    puts "Sorry, #{ @name } doesn't know how to #{ method_name }, especially with #{ args }"
    puts "... but let's give it a try anyways"

    self.class.learn_tricks(method_name)
    self.send(method_name, args.first)
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