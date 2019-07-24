require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:authored_bleats) }

  describe 'uniqueness' do

    before(:each) do
      # User.create!(
      #   email: 'tommy@appacademy.io', 
      #   password: 'hunter2', 
      #   location: Location.create(name: "Argentina")
      # )
      create(:user)
    end

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe '#is_password?' do
    let(:user) { create(:user) }

    context 'with a valid password' do
      it 'returns true' do
        expect(user.is_password?('hunter2')).to be(true)
      end
    end

    context 'w/invalid password' do
      it 'return false' do
        expect(user.is_password?('hunter3')).to be(false)
      end
    end
  end

end