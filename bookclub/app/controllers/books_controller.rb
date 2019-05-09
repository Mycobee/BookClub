class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create(book_params)
    redirect_to books_path
  end

    private
  def book_params
    params.require(:book).permit(:title, :pages, :pub_year, :thumb_url)
  end


end
