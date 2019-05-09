require 'rails_helper'

RSpec.describe 'as a user on the book index page', type: :feature do
  describe 'I see a link that adds a book' do
    xit 'shows a place to enter the title, pages, pub_year, url and submit button' do
      visit books_path
      click_link 'New Book'

      expect(current_path).to eq(new_book_path)

      fill_in 'book[title]', with: "cool book name"
      fill_in 'book[pages]', with: 100
      fill_in 'book[pub_year]', with: 1982
      fill_in 'book[thumb_url]', with: '/path/to/image.jpg'

      author = Author.create!(name: "2Pac")
      fill_in 'book[authors]', with: author.name

      click_button "Add a Book"

      expect(current_path).to eq(books_path)

      new_book = Book.last

      expect(new_book.title).to eq("Cool Book Name")
      expect(new_book.authors.first.name).to eq(author.name)

      within("#book-#{new_book.id}") do
        expect(page).to have_content(new_book.title)
      end
    end

    xit 'allows you to add more than one author seperated by commas' do
      visit new_book_path
      fill_in 'book[title]', with: "cool book name"
      fill_in 'book[pages]', with: 100
      fill_in 'book[pub_year]', with: 1982
      fill_in 'book[thumb_url]', with: '/path/to/image.jpg'
      fill_in 'book[authors]', with: "2Pac, Biggie"

      click_button "Add a Book"

      book = Book.last

      expect(book.authors[0].name).to eq("2Pac")
      expect(book.authors[1].name).to eq("Biggie")
    end

    xit 'wont accept duplicate authors' do
      visit new_book_path

      author = Author.create!(name: "2Pac")

      fill_in 'book[title]', with: "Cool Book Name"
      fill_in 'book[pages]', with: 100
      fill_in 'book[pub_year]', with: 1982
      fill_in 'book[thumb_url]', with: '/path/to/image.jpg'
      fill_in 'book[authors]', with: "2Pac, Biggie"

      click_button "Add a Book"

      author_names = Author.pluck(:name)
      expect(author_names.count).to eq(2)
    end

    it 'wont accept incorrect information' do
      # visit new_book_path
      #
      # fill_in 'book[title]', with: "title"
      # fill_in 'book[pages]', with: 1000000000
      # fill_in 'book[pub_year]', with: 1982
      # fill_in 'book[thumb_url]', with: '/path/to/image.jpg'
      # fill_in 'book[authors]', with: "2Pac, Biggie"
      #
      # click_button "Add a Book"
      #
      # expect(Book.all.count).to eq(0)
      #
      # visit new_book_path
      #
      # fill_in 'book[title]', with: "title"
      # fill_in 'book[pages]', with: 100
      # fill_in 'book[pub_year]', with: 1
      # fill_in 'book[thumb_url]', with: '/path/to/image.jpg'
      # fill_in 'book[authors]', with: "2Pac, Biggie"
      #
      # click_button "Add a Book"
      #
      # expect(Book.all.count).to eq(0)

      visit new_book_path

      book = Book.create!(title: "title", pages: 100, pub_year: 1990, thumb_url: "aeuifh")
      fill_in 'book[title]', with: "title"
      fill_in 'book[pages]', with: 100
      fill_in 'book[pub_year]', with: 1991
      fill_in 'book[thumb_url]', with: "aeuifh"
      fill_in 'book[authors]', with: "2Pac, Biggie"

      click_button "Add a Book"
  

      expect(Book.all.count).to eq(1)

    end

  end
end
