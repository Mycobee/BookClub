require 'rails_helper'
RSpec.describe 'navigation bar', type: :feature do
  it 'has link to show books' do
    visit '/'
    expect(page).to have_link("Books")

    click_link "Books"

    expect(current_path).to eq(books_path)

    click_link "Home"

    expect(current_path).to eq(home_path)
  end
end
