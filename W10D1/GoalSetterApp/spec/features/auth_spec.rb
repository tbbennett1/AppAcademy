require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "buttnuggets@batman.com"
      fill_in 'Password', :with => "nugget"
      click_on "create user"
    end


    scenario 'shows email on the homepage after signup' do
      visit new_session_url
      expect(page).to have_content "buttnuggets@batman.com"
    end
  end

  feature 'logging in' do
    scenario 'shows email on the homepage after login' do
      expect(page).to have_content "You have logged in."
    end
  end

  feature 'logging out' do

    before(:each) do
      visit new_session_url
      # fill_in 'Email', :with => "buttnuggets@batman.com"
      # fill_in 'Password', :with => "nuggetnugget"
      # click_on "create user"
    end

    scenario 'begins with a logged out state' do
      expect(page).to have_content "Log In Here"
    end
    
    scenario 'doesn\'t show email on the homepage after logout' do
      click_on "Log Out"
      expect(page).not_to have_content "This is your email: "
    end
  end
end
