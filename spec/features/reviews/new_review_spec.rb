require 'rails_helper'

RSpec.describe 'As a visitor on a book show page' do
  describe 'I click a link to add a new review for this book' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")

      visit book_path(@book_1)
    end

    it 'It takes me to a new review path where I can input review data' do
      click_link 'Add a Review'

      expect(current_path).to eq(new_book_review_path(@book_1))

      fill_in 'review[heading]', with: "Review of Book"
      fill_in 'review[full_review]', with: "OMG, love this book!!!!!!!!!!!!!!!!!!!"
      fill_in 'review[score]', with: 5
      fill_in 'review[user]', with: "Mills"

      click_button 'Add a Review'

      expect(current_path).to eq(book_path(@book_1))
      expect(Review.all.count).to eq(1)
      review = Review.last
      save_and_open_page
      expect(page).to have_content(review.heading)
      expect(page).to have_content(review.full_review)
      expect(page).to have_content(review.score)
      expect(page).to have_content(review.user)

    end
  end
end
