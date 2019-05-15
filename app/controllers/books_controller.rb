class BooksController < ApplicationController
  def index
    if params[:arg] == "highest_rated"
      @books = Book.highest_rated
    elsif params[:arg] == "lowest_rated"
      @books = Book.lowest_rated
    elsif params[:arg] == "ascending_pages"
      @books = Book.ascending_pages
    elsif params[:arg] == "descending_pages"
      @books = Book.descending_pages
    elsif params[:arg] == "descending_review_count"
      @books = Book.descending_review_count
    elsif params[:arg] == "ascending_review_count"
      @books = Book.ascending_review_count
    else
      @books = Book.all
    end

    @highest_three_books = Book.highest_three
    @lowest_three_books = Book.lowest_three
    @most_reviewing_users = Review.most_reviewing_users
  end

  def new
    @book = Book.new
    @author = Author.new
  end

  def show
    @book =  Book.find(params[:id])
    @authors = @book.authors
    @reviews = @book.reviews
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def create
    book_authors_array = book_params[:authors].split(', ')
    book = Book.find_or_create_by(title: book_params[:title].titleize, 
                                  pages: book_params[:pages], pub_year: book_params[:pub_year],
                                   thumb_url: book_params[:thumb_url])

    book_authors_array.each do |book_author|
    new_author = Author.find_or_create_by(name: book_author.titleize)
    book.authors << new_author
    end

    book.save
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :pages, :pub_year, :thumb_url, :authors)
  end
end
