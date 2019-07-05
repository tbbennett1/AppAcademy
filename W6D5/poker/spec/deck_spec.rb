require "rspec"
require "deck"
require "card"

describe Deck do
  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards}

    it "should start with 52 cards" do
      expect(all_cards.count).to eq(52)
    end

    it "should make an array filled with Card instances" do
      all = all_cards.all? { |card| card.is_a?(Card)}
      expect(all).to eq(true)
    end    
  end

  describe "#initialize" do
    # it "should call all_card" do
    #     deck = Deck.new
    #     expect(deck).to receive(:all_cards)
    # end

    it "it fills itself with 52 cards" do
        deck = Deck.new
        expect(deck.count).to eq(52)
    end

  end

end