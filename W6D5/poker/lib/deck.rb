require_relative "card"

class Deck
  def self.all_cards
    deck = []
    suits = Card::SUIT_STRINGS.keys
    values = Card::VALUE_STRINGS.keys
    suits.each do |suit|
      values.each do |value|
        deck << Card.new(suit, value)
      end
    end
    deck
  end

  def initialize
    @deck = Deck.all_cards
  end

  def count
    @deck.count
  end
end