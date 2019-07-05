class Card
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

#   BLACKJACK_VALUE = {
#     :deuce => 2,
#     :three => 3,
#     :four  => 4,
#     :five  => 5,
#     :six   => 6,
#     :seven => 7,
#     :eight => 8,
#     :nine  => 9,
#     :ten   => 10,
#     :jack  => 10,
#     :queen => 10,
#     :king  => 10
#   }
  attr_reader :suit, :value

  def initialize(suit, value)
    unless SUIT_STRINGS.keys.include?(suit) && VALUE_STRINGS.keys.include?(value)
        raise ArgumentError
    end
    @suit = suit
    @value = value
  end

end