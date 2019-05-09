require 'rails_helper'

RSpec.describe 'As a visitor on a Book Show Page' do
  describe 'I see the following information' do
    before :each do
      @book_1 = Book.create!(title: "The Hobbit", pub_year: 1937, pages: 310, thumb_url: "https://i.pinimg.com/236x/cd/d1/30/cdd130816adbd2e8b70c3ed6607fdb0c--clip-art.jpg")

      @author_1 = @book_1.authors.create!(name: "J.R.R. Tolkien")
      @author_2 = @book_1.authors.create!(name: "Ted Nugent")
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
  end
end
