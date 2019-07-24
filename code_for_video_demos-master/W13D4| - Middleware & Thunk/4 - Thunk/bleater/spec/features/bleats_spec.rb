require 'rails_helper'


feature 'creating a bleat', type: :feature do

  before(:each) do
    user = create(:user)
    login_as(user)
    make_bleat("Hello, World!")
  end
  
  scenario 'takes a body' do
    expect(page).to have_content("Hello, World!")
  end
end

feature 'bleats index', type: :feature do

  let!(:bleat) { create(:bleat) }

  scenario 'lists bleats' do
    visit bleats_url
    expect(page).to have_content(bleat.body)
  end

end