class AuthorsController < ApplicationController
  def show
   @author = Author.find(params[:id])
  end


  def destroy
    author = Author.find(params[:id])
    book_author_ids = author.books.pluck(:id)
    Book.where(id: book_author_ids).destroy_all
    author.destroy
    redirect_to books_path
  end
end
