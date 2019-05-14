require 'rails_helper'

RSpec.describe 'As a visitor on a book show page' do
  describe 'I see an area for review statistics' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")

      @review_1a = @book_1.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 4)
      @review_2a = @book_1.reviews.create(user: "Rob", heading: "Cool!", full_review: "SO good", score: 3)
      @review_3a = @book_1.reviews.create(user: "Stella", heading: "Fresh!", full_review: "Pretty great!", score: 2)
      @review_4a = @book_1.reviews.create(user: "Vince", heading: "Lit!", full_review: "Loved it!", score: 1)
    end

    it 'shows the top three reviews' do
      visit book_path(@book_1)

      within("#book-top-three") do
        expect(page).to have_link(@review_1a.user)
        expect(page).to have_content(@review_1a.heading)
        expect(page).to have_content(@review_1a.score)

        expect(page).to have_link(@review_2a.user)
        expect(page).to have_content(@review_2a.heading)
        expect(page).to have_content(@review_2a.score)

        expect(page).to have_link(@review_3a.user)
        expect(page).to have_content(@review_3a.heading)
        expect(page).to have_content(@review_3a.score)
      end
    end

    it 'shows the lowest three reviews' do
      visit book_path(@book_1)

      within("#book-lowest-three") do
        expect(page).to have_link(@review_4a.user)
        expect(page).to have_content(@review_4a.heading)
        expect(page).to have_content(@review_4a.score)

        expect(page).to have_link(@review_2a.user)
        expect(page).to have_content(@review_2a.heading)
        expect(page).to have_content(@review_2a.score)

        expect(page).to have_link(@review_3a.user)
        expect(page).to have_content(@review_3a.heading)
        expect(page).to have_content(@review_3a.score)
      end
    end
  end
end
