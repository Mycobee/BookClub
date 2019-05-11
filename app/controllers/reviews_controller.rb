class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(user: params[:name])
  end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    if Review.where(user: review_params[:user].titleize) == []
      @review = @book.reviews.create(review_params)
    end
    redirect_to book_path(@book)
  end

  private
    def review_params
      params.require(:review).permit(:user, :heading, :full_review, :score)
    end
end
