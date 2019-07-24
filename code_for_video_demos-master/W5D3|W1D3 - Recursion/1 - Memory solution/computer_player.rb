class ComputerPlayer
  attr_accessor :previous_guess, :board_size

  def initialize(size)
    @board_size = size
    @matched_cards = {}j #=> {[0,0] => true, [0,1] => true}
    @known_cards = {} #=> {[1, 1] => "tommy"}
    @previous_guess = nil
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true
    @matched_cards[pos2] = true
  end

  def get_input
    if previous_guess
      self.second_guess
    else
      self.first_guess
    end
  end

  def unmatched_pos
    (pos, _) = @known_cards.find do |pos, val|
      @known_cards.any? do |pos2, val2|
        (pos != pos2 && val == val2) &&
          !(@matched_cards[pos] || @matched_cards[pos2])
      end
    end

    pos
  end

  def match_previous
    (pos, _) = @known_cards.find do |pos, val|
      pos != previous_guess && val == @known_cards[previous_guess] &&
        !@matched_cards[pos]
    end

    pos
  end

  def first_guess
    unmatched_pos || random_guess
  end


  def second_guess
    match_previous || random_guess
  end

  def random_guess
    guess = nil

    until guess && !@known_cards[guess]
      guess = [rand(board_size), rand(board_size)]
    end

    guess
  end
end
