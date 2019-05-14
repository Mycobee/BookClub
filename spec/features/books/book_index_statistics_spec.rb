require 'rails_helper'

RSpec.describe 'As a visitor to book index page' do
 describe 'I see an area showing statistics about all books' do
   before :each do
     @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
     @book_2 = Book.create!(title: "Not The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
     @book_3 = Book.create!(title: "Sometimes The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")
     @book_4 = Book.create!(title: "Almost The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

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
   end

   it 'shows three highest rated, three lowest rated, and three most reviewing users' do
     visit books_path

     within("#highest-three-books") do
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.average_rating)
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@book_2.average_rating)
        expect(page).to have_content(@book_3.title)
        expect(page).to have_content(@book_3.average_rating)
     end

     within("#lowest-three-books") do
        expect(page).to have_content(@book_4.title)
        expect(page).to have_content(@book_3.title)
        expect(page).to have_content(@book_2.title)
     end

     within("#most-reviewing-users") do
        expect(page).to have_content(@review_1a.user)
        expect(page).to have_content(@review_2a.user)
        expect(page).to have_content(@review_3a.user)
     end
   end
 end
end
