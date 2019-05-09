require 'rails_helper'

RSpec.describe 'as a user on the book index page', type: :feature do
  describe 'I see a link that adds a book' do
    it 'shows a place to enter the title, pages, pub_year, url and submit button' do
      visit books_path
      click_link 'New Book'

      expect(current_path).to eq(new_book_path)

      fill_in 'book[title]', with: "cool book name"
      fill_in 'book[pages]', with: 100
      fill_in 'book[pub_year]', with: 1982
      fill_in 'book[thumb_url]', with: '/path/to/image.jpg'

      click_button "Add a Book"

      expect(current_path).to eq(books_path)

      @new_book = Book.last
      expect(@new_book.name).to eq("Cool Book Name")

      within("#book-#{@new_book.id}") do
        expect(page).to have_content(@new_book.title)
      end
    end

    xit 'wont accept incorrect information' do
      visit new_book_path

      fill_in 'book[title]', with: "Cool Book Name"
      fill_in 'book[pages]', with: 100
      fill_in 'book[pub_year]', with: 1982
      fill_in 'book[thumb_url]', with: '/path/to/image.jpg'


    end


  end
end
