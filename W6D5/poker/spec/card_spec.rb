require "rspec"
require "card"

describe Card do
  subject(:card) { Card.new(:clubs, :three)}

  describe "#initialize" do
    it "sets suit" do
      expect(card.instance_variable_get(:@suit)).to eq(:clubs)
    end

    it "sets value" do
      expect(card.instance_variable_get(:@value)).to eq(:three)
    end

    it "should raise an error if card suit doesn't exist" do
        expect { Card.new(:knight,:four) }.to raise_error(ArgumentError)
    end

    it "should raise an error if card value doesn't exist" do
        expect { Card.new(:spades,:twenty) }.to raise_error(ArgumentError)
    end

    it "should be able to get suit" do
        expect(card.suit).to eq(:clubs)
    end

    it "should be able to get value" do
        expect(card.value).to eq(:three)
    end

  end
end