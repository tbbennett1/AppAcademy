require "rspec"
require "tdd"

# describe Array do
#   subject(:arr1) { Array.new }

  describe "#my_uniq" do
  arr = [1,2,1,3,3]
    # it "should take in an Array" do
    #   expect(:arr1).to be_a(Array)
    # end
    it "should find unique characters only" do
      expect(arr.my_uniq).to eq([1, 2, 3])
    end
  end
# end

  describe "#two_sum" do
    arr = [-1, 0, 2, -2, 1]

    it "should find pairs that sum to 0" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2,3]])
    end

    it "should return empty array if no pair is found" do
      expect([5,5,3,1].two_sum).to eq([])
    end
    # it "should give unique pairs" do 
    #   expect do
    #     arr.two_sum.map { |pair| pair.sort}
    #   end.to 
    # end

    it "should return smaller element first" do
      expect do
        arr.two_sum.all? { |pair| pair[0] < pair[1]}
      end.to eq(true)
    end

  end