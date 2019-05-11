class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(user: review_params[:user].titleize, heading: review_params[:heading], full_review: review_params[:full_review], score: review_params[:score])
    
    redirect_to book_path(@book)
  end

  private
    def review_params
      params.require(:review).permit(:user, :heading, :full_review, :score)
    end
end
