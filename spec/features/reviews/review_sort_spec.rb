require 'rails_helper'

RSpec.describe 'As a visitor on a user show page' do
  describe 'I see links to sort reviews chronologically' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      @book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 510, thumb_url: "this_is_a_test_url")

      @review_1 = @book_1.reviews.create(user: "mills", heading: "Awesome!", full_review: "Yay", score: 5, created_at: 2.days.ago)
      @review_2 = @book_2.reviews.create(user: "mills", heading: "Not good.", full_review: "Boo", score: 1, created_at: 3.days.ago)

      visit reviews_path(name: @review_1.user)

    end

    it 'sorts by newest reviews first' do
      click_link "Newest Reviews"

      expect(page.body.index(@review_1.heading)).to be < (page.body.index(@review_2.heading))
    end

    it 'sorts by oldest reviews first' do
      click_link "Oldest Reviews"
      save_and_open_page
      expect(page.body.index(@review_1.heading)).to be > (page.body.index(@review_2.heading))
    end
  end
end
