class Dog

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # def name
  #   @name
  # end

  # def name=(new_name)
  #   @name = new_name
  # end

  def encounter_cat(cat)
    if cat.is_friendly?
      # play
      raise FriendlyCatsDontExist
    else
      run
    end
  end

  private

  def run 
    "run run ruuuuunnnn"
  end

  def play
    "play play play"
  end

end

class FriendlyCatsDontExist < RuntimeError
end