require 'rails_helper'

RSpec.describe 'As a visitor on a book show page' do
  describe 'I click on a users name for any book review' do
    before each: do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      @book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 510, thumb_url: "this_is_a_test_url")

      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")
      @author_2 = @book_2.authors.create!(name: "Not J.R.R. Tolkien")

      @review_1 = @book_1.reviews.create(user: "mills", heading: "Awesome!", full_review: "Yay", score: 5)
      @review_2 = @book_2.reviews.create(user: "mills", heading: "Not Awesome!", full_review: "Boo", score: 1)

      visit book_path(@book_1)
      click_link 'Mills'
    end

    it 'takes me to a user show page containing all headings, full reviews, scores, book titles, thumbnails, and review dates' do

      within("#review-#{@review_1.id}") do
        expect(page).to have_content(@review_1.heading)
        expect(page).to have_content(@review_1.full_review)
        expect(page).to have_content(@review_1.score)
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.thumb_url)
        expect(page).to have_content(@review_1)
      end

      within("#review-#{@review_2.id}") do
        expect(page).to have_content(@review_2.heading)
        expect(page).to have_content(@review_2.full_review)
        expect(page).to have_content(@review_2.score)
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@book_2.thumb_url)
        expect(page).to have_content(@review_2)
      end
    end
  end
end
