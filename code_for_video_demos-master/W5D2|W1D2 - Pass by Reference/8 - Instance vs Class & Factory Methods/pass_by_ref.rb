require 'byebug'

# immutable:

# mutable:


ruby_love = ["I", "Love", "Ruby"]

ruby_love.each { |word| word += "!" }

ruby_love.map { |word| word += "!" }

ruby_love.each { |word| word << "!" }

ruby_love.map { |word| word << "!" }




#########################
#Hash and Array Defaults#
#########################



a = Array.new(5)
a = Array.new(5, 10)

a = Array.new(5, [])

a = Array.new(5) { |i| [i] }

h = {}
h # {}
h[:tommy] #=> nil 
loop do 
  #play a turn 
  # h[:tommy] = h[:tommy] + 1
  # h[:tommy] = nil + 1
  if h[:tommy].nil? 
    h[:tommy] = 0 
  end
  h[:tommy] += 1 

  break
end


h = Hash.new(0)
loop do 
  #play a turn 
  # h[:tommy] = h[:tommy] + 1
  # h[:tommy] = nil + 1
  # h[:tommy] = h[:tommy] + 1
  h[:tommy] += 1 
  break
end


h = Hash.new do |the_hash, key| 
  p "in the block"
  p the_hash
  p key 
  the_array = [] 
  the_hash[key] = the_array 
  the_array
end

h = Hash.new { |scoreboard, player| scoreboard[player] = [] }


##################
#Procs and Blocks#
##################

# Block:

# Proc:

def do_block(&prc)
  debugger 
  # puts "hello from the do_block method"
  prc.call

end

# do_block { puts "hello from the block, which is being called inside the do_block method, wow" }

def do_proc(elbow)
  elbow.call
end

do_proc(Proc.new { puts "hello from the proc!" })

def do_proc_then_block(my_proc)
  # Implement me!
  do_proc(my_proc)
  do_block(&my_proc)
end


#################################
#attr_accessor and class methods#
#################################

class Fish

  def self.make_random_fish
    debugger
    name = ""
    5.times do
      name << ('a'..'z').to_a.sample
    end
    # self is the CLASS itself (Fish)
    self.new(name, [true, false].sample)
  end

  def self.make_nemo
    Fish.new("nemo", self.random_state_of_being)
  end

  def self.random_state_of_being
    [true, false].sample
  end

  # attr_reader :name
  # attr_writer :name 
  attr_accessor :name

  def initialize(name, lost)
    @name = name
    @lost = lost
  end

  # def name 
  #   @name 
  # end

  def lost?
    @lost 
  end

  # def name=(new_name)
  #   @name = new_name
  # end

  def find
    @lost = false
  end

end
