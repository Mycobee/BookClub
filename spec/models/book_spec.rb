require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it {should have_many(:book_authors)}
    it {should have_many(:authors).through(:book_authors)}
    it {should have_many(:reviews)}
  end

  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:pages)}
    it {should validate_presence_of(:pub_year)}

    it {should validate_numericality_of(:pages)}
    it {should validate_numericality_of(:pub_year)}

   it {should validate_inclusion_of(:pages).in_range(1..15000)}
   it {should validate_inclusion_of(:pub_year).in_range(1455..2025)}

  # it {should validate_uniqueness_of(:title)}
  end

  describe 'instance methods' do
    it '#total_reviews' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      author_1 = book_1.authors.create!(name: "J.R.R. Tolkien")

      review_1 = book_1.reviews.create!(user: "Mills", heading: "Couldn't dig it.", full_review: "Not my jam, too hard to read. Not enough pictures", score: 2)
      review_2 = book_1.reviews.create!(user: "Rob", heading: "BEST BOOK EVER", full_review: "OMG, it was like, THE BEST BOOK. FOREVER. LITERALLY. EVER. LITERALLY.", score: 5)

      expect(book_1.total_reviews).to eq(2)
    end

    it '#average_rating' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      author_1 = book_1.authors.create!(name: "J.R.R. Tolkien")

      review_1 = book_1.reviews.create!(user: "Mills", heading: "Couldn't dig it.", full_review: "Not my jam, too hard to read. Not enough pictures", score: 2)
      review_2 = book_1.reviews.create!(user: "Rob", heading: "BEST BOOK EVER", full_review: "OMG, it was like, THE BEST BOOK. FOREVER. LITERALLY. EVER. LITERALLY.", score: 4)

      expect(book_1.average_rating).to eq(3)
    end

    it '#top_three' do
        book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

        review_1a= book_1.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
        review_2a = book_1.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 4)
        review_3a = book_1.reviews.create(user: "Stella", heading: "Awesome!", full_review: "Yay", score: 3)
        review_4a = book_1.reviews.create(user: "Vince", heading: "Awesome!", full_review: "Yay", score: 2)

        expect(book_1.top_three).to eq([review_1a, review_2a, review_3a])
    end

    it '#lowest_three' do
        book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

        review_1a= book_1.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
        review_2a = book_1.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 4)
        review_3a = book_1.reviews.create(user: "Stella", heading: "Awesome!", full_review: "Yay", score: 3)
        review_4a = book_1.reviews.create(user: "Vince", heading: "Awesome!", full_review: "Yay", score: 2)

        expect(book_1.lowest_three).to eq([review_4a, review_3a, review_2a])
    end

    it '#top_review' do
        book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

        review_1a= book_1.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
        review_2a = book_1.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 4)

        expect(book_1.top_review).to eq(review_1a)
    end
  end

  describe 'class methods' do
    it '.ascending_pages' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 500, thumb_url: "this_is_a_test_url")
      book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      book_3 = Book.create!(title: "Maybe The Hobbit", pub_year: 1937, pages: 110, thumb_url: "this_is_a_test_url")

      expect(Book.ascending_pages).to eq([book_3, book_2, book_1])
    end

    it '.decending_pages' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 500, thumb_url: "this_is_a_test_url")
      book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      book_3 = Book.create!(title: "Maybe The Hobbit", pub_year: 1937, pages: 110, thumb_url: "this_is_a_test_url")

      expect(Book.descending_pages).to eq([book_1, book_2, book_3])
    end

    it '.ascending_review_count' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 500, thumb_url: "this_is_a_test_url")
      book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

      review_1 = book_1.reviews.create!(user: "Mills", heading: "Couldn't dig it.", full_review: "Not my jam, too hard to read. Not enough pictures", score: 2)
      review_2 = book_1.reviews.create!(user: "Rob", heading: "BEST BOOK EVER", full_review: "OMG, it was like, THE BEST BOOK. FOREVER. LITERALLY. EVER. LITERALLY.", score: 4)

      review_3 = book_2.reviews.create!(user: "Joe", heading: "Eh", full_review: "Great book", score: 3)

      expect(Book.ascending_review_count).to eq([book_2, book_1])
    end

    it '.descending_review_count' do
        book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 500, thumb_url: "this_is_a_test_url")
        book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

        review_1 = book_1.reviews.create!(user: "Mills", heading: "Couldn't dig it.", full_review: "Not my jam, too hard to read. Not enough pictures", score: 2)
        review_2 = book_1.reviews.create!(user: "Rob", heading: "BEST BOOK EVER", full_review: "OMG, it was like, THE BEST BOOK. FOREVER. LITERALLY. EVER. LITERALLY.", score: 4)

        review_3 = book_2.reviews.create!(user: "Joe", heading: "Eh", full_review: "Great book", score: 3)

        expect(Book.descending_review_count).to eq([book_1, book_2])
    end

    it '.highest_rated' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 500, thumb_url: "this_is_a_test_url")
      book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      book_3 = Book.create!(title: "Never The Hobbit", pub_year: 1937, pages: 110, thumb_url: "this_is_a_test_url")
      book_4 = Book.create!(title: "Sometimes The Hobbit", pub_year: 1937, pages: 110, thumb_url: "this_is_a_test_url")

      review_1 = book_1.reviews.create!(user: "Mills", heading: "Couldn't dig it.", full_review: "Not my jam, too hard to read. Not enough pictures", score: 2)

      review_2 = book_2.reviews.create!(user: "Rob", heading: "BEST BOOK EVER", full_review: "OMG, it was like, THE BEST BOOK. FOREVER. LITERALLY. EVER. LITERALLY.", score: 3)

      review_3 = book_3.reviews.create!(user: "Joe", heading: "Worst", full_review: "sadkjfnwieuf.", score: 4)

      review_4 = book_4.reviews.create!(user: "Pam", heading: "Fantastic.", full_review: "AKsjdsi", score: 5)

      expect(Book.highest_rated).to eq([book_4, book_3, book_2])
    end

    it '.lowest_rated' do
      book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 500, thumb_url: "this_is_a_test_url")
      book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
      book_3 = Book.create!(title: "Never The Hobbit", pub_year: 1937, pages: 110, thumb_url: "this_is_a_test_url")
      book_4 = Book.create!(title: "Sometimes The Hobbit", pub_year: 1937, pages: 110, thumb_url: "this_is_a_test_url")

      review_1 = book_1.reviews.create!(user: "Mills", heading: "Couldn't dig it.", full_review: "Not my jam, too hard to read. Not enough pictures", score: 2)

      review_2 = book_2.reviews.create!(user: "Rob", heading: "BEST BOOK EVER", full_review: "OMG, it was like, THE BEST BOOK. FOREVER. LITERALLY. EVER. LITERALLY.", score: 3)

      review_3 = book_3.reviews.create!(user: "Joe", heading: "Worst", full_review: "sadkjfnwieuf.", score: 4)

      review_4 = book_4.reviews.create!(user: "Pam", heading: "Fantastic.", full_review: "AKsjdsi", score: 5)

      expect(Book.lowest_rated).to eq([book_1, book_2, book_3])
    end
  end
end
