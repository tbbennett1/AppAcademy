require 'dog'

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

end