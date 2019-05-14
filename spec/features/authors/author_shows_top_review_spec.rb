require 'rails_helper'

RSpec.describe 'As a visitor on an author show page' do
  describe 'for each book by that author' do
    before :each do
      @book_1 = Book.create!(title: "1", pages: 123, pub_year: 1633, thumb_url: "http://1.bp.blogspot.com/-0Eud_yilPHE/T9YoB5EkjwI/AAAAAAAACoU/i03_cZPChjs/s1600/books_color3_1024x1024_signed_ipad.jpg")
      @author_1 = @book_1.authors.create!(name: "2 Pac")

      @book_2 = @author_1.books.create!(title: "2", pages: 123, pub_year: 1734, thumb_url: "http://www.clipartsuggest.com/images/402/spanish-mission-clipart-http-www-dreamstime-com-royalty-free-stock-SbdxDC-clipart.jpg")

      @review_1 = @book_1.reviews.create(user: "mills", heading: "Awesome!", full_review: "Yay", score: 5)

      visit author_path(@author_1)
    end

    it 'shows the top review' do
      expect(page).to have_content(@review_1.user)
      expect(page).to have_content(@review_1.heading)
      expect(page).to have_content(@review_1.score)
    end
  end
end
