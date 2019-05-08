require 'rails_helper'

RSpec.describe 'book index page', type: :feature do
  before :each do
    @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
    @book_2 = Book.create!(title: "The Lord of the Rings", pub_year: 1954, pages: 1008, thumb_url: "this_is_a_test_url")

    @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")
    @author_2 = @book_1.authors.create!(name: "Ted Nugent")

    @author_3 = @book_2.authors.create!(name: "Bob Marley")
  end

  it 'shows all the titles, pub_years, pages, thumb_url and authors' do
    visit books_path
    within("#book-#{@book_1.id}") do
      save_and_open_page
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.pub_year)
      expect(page).to have_content(@book_1.pages)
      expect(page).to have_content(@book_1.thumb_url)
      expect(page).to have_content(@author_1.name)
      expect(page).to have_content(@author_2.name)
    end

    within("#book-#{@book_2.id}") do
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content(@book_2.pub_year)
      expect(page).to have_content(@book_2.pages)
      expect(page).to have_content(@book_2.thumb_url)
      expect(page).to have_content(@author_3.name)
    end
  end
end
