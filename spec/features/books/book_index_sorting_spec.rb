require 'rails_helper'

RSpec.describe 'As a visitor to book index page' do
  before :each do
    @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 1000, thumb_url: "this_is_a_test_url")
    @book_2 = Book.create!(title: "Cars", pub_year: 1937, pages: 700, thumb_url: "this_is_a_test_url")
    @book_3 = Book.create!(title: "Trees in Space", pub_year: 1937, pages: 500, thumb_url: "this_is_a_test_url")
    @book_4 = Book.create!(title: "Ocean", pub_year: 1937, pages: 200, thumb_url: "this_is_a_test_url")

    @review_1a= @book_1.reviews.create(user: "Mills", heading: "Awesome!", full_review: "Yay", score: 5)
    @review_1b = @book_2.reviews.create(user: "Mills", heading: "Fun!", full_review: "Yay", score: 4)
    @review_1c = @book_3.reviews.create(user: "Mills", heading: "Cool!", full_review: "Yay", score: 3)
    @review_1d = @book_4.reviews.create(user: "Mills", heading: "Eh.", full_review: "Yay", score: 2)

    @review_2a = @book_1.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 5)
    @review_2b = @book_2.reviews.create(user: "Rob", heading: "Fun!", full_review: "Yay", score: 4)
    @review_2c = @book_3.reviews.create(user: "Rob", heading: "Awesome!", full_review: "Yay", score: 3)

    @review_3a = @book_1.reviews.create(user: "Stella", heading: "Awesome!", full_review: "Yay", score: 5)
    @review_3b = @book_2.reviews.create(user: "Stella", heading: "Fun!", full_review: "Yay", score: 4)


    @review_4a = @book_1.reviews.create(user: "Vince", heading: "Awesome!", full_review: "Yay", score: 5)

    visit books_path
  end

  describe 'I see links to sort books' do

    it 'can sort by descending rating' do
      click_link "Highest Rated"

      within("#index-books") do
        index1 = page.body.index("book-#{@book_1.id}")
        index2 = page.body.index("book-#{@book_2.id}")
        index3 = page.body.index("book-#{@book_3.id}")
        index4 = page.body.index("book-#{@book_4.id}")

        expect(index1).to be < index2
        expect(index2).to be < index3
        expect(index3).to be < index4
      end
    end

    it 'can sort by ascending rating' do
      click_link "Lowest Rated"


      within("#index-books") do
        index1 = page.body.index("book-#{@book_1.id}")
        index2 = page.body.index("book-#{@book_2.id}")
        index3 = page.body.index("book-#{@book_3.id}")
        index4 = page.body.index("book-#{@book_4.id}")

        expect(index4).to be < index3
        expect(index3).to be < index2
        expect(index2).to be < index1
      end
    end

    it 'can sort by descending or ascending number of pages' do
      click_link "Most Pages"

      within("#index-books") do
        index1 = page.body.index("book-#{@book_1.id}")
        index2 = page.body.index("book-#{@book_2.id}")
        index3 = page.body.index("book-#{@book_3.id}")
        index4 = page.body.index("book-#{@book_4.id}")

        expect(index1).to be < index2
        expect(index2).to be < index3
        expect(index3).to be < index4
      end

      click_link "Least Pages"

      within("#index-books") do
        index1 = page.body.index("book-#{@book_1.id}")
        index2 = page.body.index("book-#{@book_2.id}")
        index3 = page.body.index("book-#{@book_3.id}")
        index4 = page.body.index("book-#{@book_4.id}")

        expect(index4).to be < index3
        expect(index3).to be < index2
        expect(index2).to be < index1
      end
    end

    it 'can sort by descending or ascending number of reviews' do
      click_link "Most Reviewed"

      within("#index-books") do
        index1 = page.body.index("book-#{@book_1.id}")
        index2 = page.body.index("book-#{@book_2.id}")
        index3 = page.body.index("book-#{@book_3.id}")
        index4 = page.body.index("book-#{@book_4.id}")

        expect(index1).to be < index2
        expect(index2).to be < index3
        expect(index3).to be < index4
      end

      click_link "Least Reviewed"

      within("#index-books") do
        index1 = page.body.index("book-#{@book_1.id}")
        index2 = page.body.index("book-#{@book_2.id}")
        index3 = page.body.index("book-#{@book_3.id}")
        index4 = page.body.index("book-#{@book_4.id}")

        expect(index4).to be < index3
        expect(index3).to be < index2
        expect(index2).to be < index1
      end
    end
  end
end
