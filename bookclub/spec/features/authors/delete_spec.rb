require 'rails_helper'

RSpec.describe 'As a visior on an author show page' do
  describe 'I see a link to delete the author' do
    before :each do
        @book_1 = Book.create!(title: "Guuuurrrr", pages: 348, pub_year: 1970)
        @author_1 = @book_1.authors.create!(name: "Person")
        @author_2 = @book_1.authors.create!(name: "Human")

        @book_2 = @author_2.books.create!(title: "Nooooooo", pages: 34, pub_year: 1999)
      end


    it 'deletes the author and redirects to the books index' do

      visit author_path(@author_1)

      click_link "Delete Author"
      save_and_open_page

      expect(current_path).to eq(books_path)

      expect(page).to_not have_content(@author_1.name)
      expect(page).to_not have_content(@book_1.title)
      expect(page).to have_content(@book_2.title)
    end
  end
end
