require 'rails_helper'

RSpec.feature 'Creating a category', type: :feature do
  scenario 'User creates a new category' do
    visit new_category_path
    fill_in 'Name', with: 'Pets'
    click_button 'Create Category'
    sleep(1)
    visit categories_path
    expect(page).to have_content('Pets')
  end

  scenario 'Invalid category creation' do
    visit new_category_path
    fill_in 'Name', with: ''
    click_button 'Create Category'
    sleep(1)
    visit new_category_path
    expect(page).to have_content('Category was not created.')
    page.assert_selector('div.alert-danger')
  end
end