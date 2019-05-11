require 'rails_helper'

RSpec.describe 'As a visitor on a user show page' do
  describe 'I see a delete link next to each review ' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      @book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 510, thumb_url: "this_is_a_test_url")

      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")
      @author_2 = @book_2.authors.create!(name: "Not J.R.R. Tolkien")

      @review_1 = @book_1.reviews.create(user: "mills", heading: "Awesome!", full_review: "Yay", score: 5)
      @review_2 = @book_2.reviews.create(user: "mills", heading: "Not good.", full_review: "Boo", score: 1)

      visit book_path(@book_1)
      click_link("Mills")
    end

    it 'returns me to the user show page where the review is deleted' do
      within("#review-#{@review_1.id}") do
        click_link("Delete Review")
      end

      expect(current_path).to eq(reviews_path)
      expect(page).to_not have_content(@review_1.heading)
      expect(page).to have_content(@review_2.heading)
    end
  end
end
