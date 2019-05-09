class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @author = Author.new
  end

  def show
    @book =  Book.find(params[:id])
    @authors = @book.authors
  end

  def create
    book_authors_array = book_params[:authors].split(', ')
    book = Book.find_by(title: book_params[:title].titleize)

    if book == nil
      if book_params[:thumb_url] == ""
        book = Book.new(title: book_params[:title], pages: book_params[:pages], pub_year:   book_params[:pub_year], thumb_url: "https://i.pinimg.com/236x/cd/d1/30/cdd130816adbd2e8b70c3ed6607fdb0c--clip-art.jpg")
      else
        book = Book.new(title: book_params[:title], pages: book_params[:pages], pub_year:   book_params[:pub_year], thumb_url: book_params[:thumb_url])
      end
    end

    new_author_array = []

    book_authors_array.each do |book_author|
      existing_author = Author.find_by(name: book_author)
      if existing_author != nil
        new_author_array << existing_author
      else
        new_author = Author.create(name: book_author)
        new_author_array << new_author
      end
    end

    new_author_array.each do |author|
      book.authors << author
    end

    book.save

    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :pages, :pub_year, :thumb_url, :authors)
  end
end
