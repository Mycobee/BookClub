require 'rails_helper'

RSpec.describe 'As a visitor on a Book Show Page' do
  describe 'I see the following information' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "https://i.pinimg.com/236x/cd/d1/30/cdd130816adbd2e8b70c3ed6607fdb0c--clip-art.jpg")

      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")
      @author_2 = @book_1.authors.create!(name: "Ted Nugent")

      @review_1 = @book_1.reviews.create!(heading: "Great Book!", user: "Rob", score: 5, full_review: "OH my god, I love this boooooooooook!")
      @review_2 = @book_1.reviews.create!(heading: "BOOK SUCKS", user: "Rob S.", score: 1, full_review: "Who reads in 2019???")
      @review_3 = @book_1.reviews.create!(heading: "It was ok. ", user: "Mills", score: 4, full_review: "I mean, I've read better.")
    end

    it 'shows the title, author, pages, pub_year and full sized image' do
      visit book_path(@book_1)

      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.pub_year)
      expect(page).to have_content(@book_1.pages)
      expect(page).to have_content(@author_1.name)
      expect(page).to have_content(@author_2.name)

      expect(page).to have_css("img[src*='#{@book_1.thumb_url}']")

    end

    it 'shows all review titles, users, ratings and text' do
      visit book_path(@book_1)

      within "#review-#{@review_1.id}" do
        expect(page).to have_content(@review_1.heading)
        expect(page).to have_content(@review_1.user)
        expect(page).to have_content(@review_1.score)
        expect(page).to have_content(@review_1.full_review)
      end

      within "#review-#{@review_2.id}" do
        expect(page).to have_content(@review_2.heading)
      end

      within "#review-#{@review_3.id}" do
        expect(page).to have_content(@review_3.heading)
      end
    end
  end
end
