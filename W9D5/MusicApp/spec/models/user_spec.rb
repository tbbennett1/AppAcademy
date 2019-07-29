require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  subject(:user) do
    FactoryBot.build(:user,
      email: "brucewayne@bw.com",
      password: "iambatman")
  end

  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("iambatman")).to be true
    end

    it "verifies a password is incorrect" do 
      expect(user.is_password?("iamrobin")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      # Miniscule chance this will fail.
      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }
    
    it "returns user given good credentials" do
      expect(User.find_by_credentials("brucewayne@bw.com", "iambatman")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("brucewade@bw.com", "iambatman")).to eq(nil)
    end
  end
end
