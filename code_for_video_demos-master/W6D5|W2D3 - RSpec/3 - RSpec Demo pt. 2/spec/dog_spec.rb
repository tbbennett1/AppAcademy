require 'dog'
# require 'cat'
require 'byebug'

describe Dog do

  subject(:lola) { Dog.new("Lola") }

  it "#initializes" do
    expect(lola).to be_a(Dog)
  end

  it "has a #name" do
    expect(lola.name).to eq("Lola")
  end

  it "can change name (#name=)" do
    lola.name = "Lolita"
    expect(lola.name).to eq("Lolita")
  end

  describe "#encounter_cat" do

    let(:cat) { double("Cat") }

    context "when cat is mean" do
      it "runs away" do
        # cat = Cat.new(false) # false for #is_friendly?
        # cat = double("Cat", is_friendly?: false)
        # debugger
        allow(cat).to receive(:is_friendly?).and_return(false)

        expect(lola).to receive(:run)
        lola.encounter_cat(cat)
      end
    end

    context "when cat is friendly" do
      it "plays" do
        # cat = Cat.new(true)
        # cat = double("Cat", is_friendly?: true)
        allow(cat).to receive(:is_friendly?).and_return(true)

        # expect(lola).to receive(:play)
        # lola.encounter_cat(cat)
        expect do 
          lola.encounter_cat(cat) 
        end.to raise_error(FriendlyCatsDontExist)
      end
    end
  end

end