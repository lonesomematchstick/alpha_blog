require 'rails_helper'

RSpec.feature 'Signing Up', type: :feature do

  scenario 'Person signs up for an account' do
    visit signup_path
    fill_in 'Username', with: 'username'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Create User'
    visit user_path(User.last)
    expect(page).to have_css('h1', text: "#{User.last.username.upcase}'S PROFILE" )
  end

end