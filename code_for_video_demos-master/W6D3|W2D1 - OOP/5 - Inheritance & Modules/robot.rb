class Robot
  include Walkable
  # extend Walkable

  def initialize(name)
    @name = name
    # Walkable::NUM_LEGS
    # self.num_legs
  end

  # def walk
  #   #does something else
  # end

  private
  attr_reader :name

end