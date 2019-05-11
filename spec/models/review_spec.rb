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
  #
  # describe 'class methods' do
  #
  # end


end
