require 'rails_helper'

RSpec.describe 'As a visitor on any part of the site except the author show page' do
	describe 'when I see an author name' do 

	before :each do
		@author_1 = Author.create!(name: "Bob")
		@book_1 = @author_1.books.create!(title: "wrinkled time is tite", pages: 483, thumb_url: "Party and bullshit", pub_year: 1989) 
		@book_2 = @author_1.books.create!(title: "life is tite", pages: 222, thumb_url: "fake thumbs are hard", pub_year: 1888) 
	end
		it 'is a functional link to an author show page' do
			visit books_path
			click_link(@author_1.name)
			expect(current_path).to eq(author_path(@author_1))
		end
	end
end
