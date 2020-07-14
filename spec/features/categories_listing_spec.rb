require 'rails_helper'

RSpec.feature 'Listing categories', type: :feature do
  let(:category) { create(:category) }
  let(:category2) { create(:category) }

  scenario 'User goes to categories index' do
    category
    category2
    visit categories_path
    expect(page).to have_link 'View Articles', href: category_path(category)
    expect(page).to have_link 'View Articles', href: category_path(category2)
    click_link 'View Articles', href: category_path(category)
    visit category_path(category)
    expect(page).to have_css('h1', text: "#{category.name} Related Articles" )
  end

end