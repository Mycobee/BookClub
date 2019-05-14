require 'rails_helper'

RSpec.describe 'As a visitor to book index page' do
  describe 'next to each book title' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

      @review_1a= @book_1.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
      @review_2a = @book_1.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 5)
      @review_3a = @book_1.reviews.create(user: "Stella", heading: "Awesome!", full_review: "Yay", score: 5)
      @review_4a = @book_1.reviews.create(user: "Vince", heading: "Awesome!", full_review: "Yay", score: 5)
    end

    it 'shows average rating and total number of reviews' do
      visit books_path
      within("#book-#{@book_1.id}") do
        expect(page).to have_content(@book_1.average_rating)
        expect(page).to have_content(@book_1.total_reviews)
      end
    end
  end
end
