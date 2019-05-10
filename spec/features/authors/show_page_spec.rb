require 'rails_helper'

RSpec.describe 'as a visitor on the author show page', type: :feature do
  describe 'the page will show' do
    before :each do

      @book_1 = Book.create!(title: "1", pages: 123, pub_year: 1633, thumb_url: "http://1.bp.blogspot.com/-0Eud_yilPHE/T9YoB5EkjwI/AAAAAAAACoU/i03_cZPChjs/s1600/books_color3_1024x1024_signed_ipad.jpg")

      @author_1 = @book_1.authors.create!(name: "2 Pac")
      @author_2 = @book_1.authors.create!(name: "Biggie")

      @book_2 = @author_1.books.create!(title: "2", pages: 123, pub_year: 1734, thumb_url: "http://www.clipartsuggest.com/images/402/spanish-mission-clipart-http-www-dreamstime-com-royalty-free-stock-SbdxDC-clipart.jpg")
      @book_3 = @author_1.books.create!(title: "3", pages: 3567, pub_year: 2007, thumb_url: "https://imaginationsoup.net/wp-content/uploads/2016/01/chapter-books-about-zombies.jpg")
    end

    it 'shows all book titles, number of pages, pub year and image' do
      visit author_path(@author_1)

      expect(page).to have_content(@author_1.name)

      within "#author-book-#{@book_1.id}" do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.pages)
        expect(page).to have_content(@book_1.pub_year)
        expect(page).to have_css("img[src*='#{@book_1.thumb_url}']")
      end

      within "#author-book-#{@book_2.id}" do
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@book_2.pages)
        expect(page).to have_content(@book_2.pub_year)
        expect(page).to have_css("img[src*='#{@book_2.thumb_url}']")
      end

      within "#author-book-#{@book_3.id}" do
        expect(page).to have_content(@book_3.title)
        expect(page).to have_content(@book_3.pages)
        expect(page).to have_content(@book_3.pub_year)
        expect(page).to have_css("img[src*='#{@book_3.thumb_url}']")
      end
    end

    it 'shows co-authors' do
      visit author_path(@author_1)

      within "#author-book-#{@book_1.id}" do
        expect(page).to have_content("#{@author_2.name}")
      end

      within "#author-book-#{@book_2.id}" do
        expect(page).to_not have_content("#{@author_2.name}")
      end
    end
  end
end
