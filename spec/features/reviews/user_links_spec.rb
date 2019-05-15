require 'rails_helper'

RSpec.describe 'As a visitor anywhere on the site' do
  describe 'anywhere I see a users name' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")
      @review_1 = @book_1.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
    end

    it 'is a link I can click to the user show page' do
      visit books_path

      click_link(@review_1.user)

      expect(current_path).to eq(reviews_path)

      visit book_path(@book_1)

      within(".book-top-three") do
        click_link @review_1.user
      end

      expect(current_path).to eq(reviews_path)

      visit author_path(@author_1)

      click_link(@review_1.user)

      expect(current_path).to eq(reviews_path)
    end
  end
end
