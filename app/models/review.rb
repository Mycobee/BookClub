class Review < ApplicationRecord
  belongs_to :book
  before_save :titleize_review


  def titleize_review
    self.user = self.user.titleize
  end

  def self.most_reviewing_users
    Review.select('reviews.user, COUNT(*)').group(:user).order('reviews.count DESC').limit(3)
  end

  def self.oldest_reviews
    Review.order(:created_at)
  end

  def self.newest_reviews
    Review.order(created_at: :desc)
  end
end
