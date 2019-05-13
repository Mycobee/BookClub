require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'relationships' do
    it {should belong_to(:book)}
  end

  describe 'validations' do
    # it {should validate_uniqueness_of(:user)}
  end

  describe 'instance methods' do
    it '#titleize_review' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

      author_1 = book_1.authors.create!(name: "J.R.R. Tolkien")

      review = book_1.reviews.create(user: "mills", heading: "Awesome!", full_review: "Yay", score: 5)

      expect(review.user).to eq("Mills")
    end
  end

  describe 'class methods' do
    it 'most_reviewing_user' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      book_3 = Book.create!(title: "Sometimes The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      book_4 = Book.create!(title: "Almost The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

      review_1a= book_1.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
      review_1b = book_2.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
      review_1c = book_3.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
      review_1d = book_4.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)

      review_2a = book_1.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 5)
      review_2b = book_2.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 5)
      review_2c = book_3.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 5)

      review_3a = book_1.reviews.create(user: "Stella", heading: "Awesome!", full_review: "Yay", score: 5)
      review_3b = book_2.reviews.create(user: "Stella", heading: "Awesome!", full_review: "Yay", score: 5)


      review_4a = book_1.reviews.create(user: "Vince", heading: "Awesome!", full_review: "Yay", score: 5)

      expected = ["Mills", "Rob", "Stella"]
      expect(Review.most_reviewing_users[0].user).to eq("Mills")
      expect(Review.most_reviewing_users[1].user).to eq("Rob")
      expect(Review.most_reviewing_users[2].user).to eq("Stella")

      expect(Review.most_reviewing_users[0].count).to eq(4)
      expect(Review.most_reviewing_users[1].count).to eq(3)
      expect(Review.most_reviewing_users[2].count).to eq(2)
      
    end
  end


end
