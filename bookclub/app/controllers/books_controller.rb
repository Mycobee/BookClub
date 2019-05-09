class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @author = Author.new
  end

  def create
    book = Book.new(title: book_params[:title], pages: book_params[:pages], pub_year: book_params[:pub_year], thumb_url: book_params[:thumb_url])

    author = Author.new(name: book_params[:authors])

    book.authors << author

    book.save
    binding.pry
    #   if Book.find_by(title: book.title) == nil
    #     if book.save
    #       author_params[:authors].split(', ').each do |author_param|
    #       if Author.find_by(name: author_param.strip)
    #         book.authors << Author.find_by(name: author_param.strip)
    #       else
    #         book.authors.create(name: author_param.strip)
    #       end
    #     end
    #   else
    #     render :new
    #   end
    # end
    #
    #
    # binding.pry
    redirect_to books_path
  end

    private
  def book_params
    params.require(:book).permit(:title, :pages, :pub_year, :thumb_url, :authors)
  end

  # def author_params
  #   params.permit(:authors)
  # end
end
