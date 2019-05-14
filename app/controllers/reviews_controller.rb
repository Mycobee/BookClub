class ReviewsController < ApplicationController
  def index
    if params[:arg] == "newest_reviews"
      @reviews = Review.where(user: params[:name])
      @reviews = @reviews.newest_reviews
    elsif
      params[:arg] == "oldest_reviews"
        @reviews = Review.where(user: params[:name])
        @reviews = @reviews.oldest_reviews
    else
      @reviews = Review.where(user: params[:name])
    end
      @user = params[:name]
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

  def destroy
    Review.destroy(params[:id])
    redirect_to reviews_path
  end

  private
    def review_params
      params.require(:review).permit(:user, :heading, :full_review, :score)
    end
end
