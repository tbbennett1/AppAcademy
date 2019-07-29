require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryBot.build(:user, 
      email:"brucewayne@batman.com", 
      password: "iambatman",
      session_token: "12345"
      )
  end

  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "verifies password is correct" do
      expect(user.is_password?("iambatman")).to be true
    end

    it "verifies password is incorrect" do
      expect(user.is_password?("iamJOKER")).to be false
    end
  end

  describe "#password=" do
    it "should set password equal to value" do
      user.password = "IAMTHEDARKKNIGHT"
      expect(user.password).to eq("IAMTHEDARKKNIGHT")
    end
  end

  describe "#ensure_session_token" do
    it "should always have session token for logged in user" do
      expect(user.session_token).not_to be nil
    end
  end

  describe "#reset_session_token!" do

  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("brucewayne@batman.com", "iambatman")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("brucewayne@batman.com", "wrongpw")).to eq(nil)
    end
  end

end
