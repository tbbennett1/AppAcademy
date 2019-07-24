class Robot
  def initialize(name)
    @name = name
  end

  def walk
    puts "*#{name} is walking*"
  end

  private
  attr_reader :name

end