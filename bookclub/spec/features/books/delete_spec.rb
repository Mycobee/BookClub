require 'rails_helper'

RSpec.describe 'As a visitor on a book show page' do
  describe 'I see a link to delete a book' do
    it 'deletes the book and returns me to the books index page' do
      @book_1 = Book.create!(title: "Great Book", pages: 4329, pub_year: 1874)
      visit book_path(@book_1)

      click_link "Delete Book"

      expect(current_path).to eq(books_path)

      expect(page).to_not have_content(@book_1.title)

    end
  end
end
