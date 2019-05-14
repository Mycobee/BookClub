require 'rails_helper'

RSpec.describe 'As a visitor on a book show page' do
  describe 'I click on a users name for any book review' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      @book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 510, thumb_url: "this_is_a_test_url")

      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")
      @author_2 = @book_2.authors.create!(name: "Not J.R.R. Tolkien")

      @review_1 = @book_1.reviews.create(user: "mills", heading: "Awesome!", full_review: "Yay", score: 5)
      @review_2 = @book_2.reviews.create(user: "mills", heading: "Not Awesome!", full_review: "Boo", score: 1)
      @review_3 = @book_1.reviews.create(user: "rob", heading: "Ehhhh", full_review: "Ok, I guess.", score: 3)

      visit book_path(@book_1)
      
      within("#book-top-three") do
        click_link 'Mills'
      end
    end

    it 'takes me to a user show page containing all headings, full reviews, scores, book titles, thumbnails, and review dates' do

      expect(current_path).to eq(reviews_path)


      within("#review-#{@review_1.id}") do
        expect(page).to have_content(@review_1.heading)
        expect(page).to have_content(@review_1.full_review)
        expect(page).to have_content(@review_1.score)
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@review_1.created_at)
        expect(page).to have_css("img[src*='#{@book_1.thumb_url}']")
      end

      within("#review-#{@review_2.id}") do
        expect(page).to have_content(@review_2.heading)
        expect(page).to have_content(@review_2.full_review)
        expect(page).to have_content(@review_2.score)
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@review_2.created_at)
        expect(page).to have_css("img[src*='#{@book_2.thumb_url}']")
      end
    end

    it 'should not show reviews from other users' do
        expect(page).to_not have_content(@review_3.heading)
    end
  end
end
