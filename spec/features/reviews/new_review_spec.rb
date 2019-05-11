require 'rails_helper'

RSpec.describe 'As a visitor on a book show page' do
  describe 'I click a link to add a new review for this book' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "this_is_a_test_url")

      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")

      visit book_path(@book_1)
    end

    it 'It takes me to a new review path where I can input review data' do


    end
  end
end
