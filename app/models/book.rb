class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors


  validates :title, presence: true, uniqueness: true
  validates :pages, presence: true, numericality: true, inclusion: { in: 1..15000 }
  validates :pub_year, presence: true, numericality: true, inclusion: { in: 1455..2025}

  before_save  :titleize_title, :set_thumb

  def titleize_title
    self.title = self.title.titleize
  end

  def set_thumb
    if self.thumb_url == ""
      self.thumb_url = "https://i.pinimg.com/236x/cd/d1/30/cdd130816adbd2e8b70c3ed6607fdb0c--clip-art.jpg"
    end
  end 

  def total_reviews
    self.reviews.count
  end

  def average_rating
    self.reviews.average(:score)
  end

  def top_three
    self.reviews.order(score: :desc).limit(3)
  end

  def lowest_three
    self.reviews.order(:score).limit(3)
  end

  def top_review
    self.reviews.order(score: :desc).first
  end

  def self.ascending_pages
      Book.order(:pages)
  end

  def self.descending_pages
    Book.order(pages: :desc)
  end

  def self.ascending_review_count
    book_ids = Review.joins(:book).select('book_id, count(*)').group(:book_id).order(count: :asc).pluck(:book_id)
    Book.find(book_ids)
  end

  def self.descending_review_count
    book_ids = Review.joins(:book).select('book_id, count(*)').group(:book_id).order(count: :desc).pluck(:book_id)
    Book.find(book_ids)
  end

  def self.highest_three
    Book.select('books.*, avg(reviews.score)').joins(:reviews).group(:id).order('avg desc').limit(3)
  end

  def self.lowest_three
    Book.select('books.*, avg(reviews.score)').joins(:reviews).group(:id).order('avg asc').limit(3)
  end


  def self.highest_rated
    Book.select('books.*, avg(reviews.score)').joins(:reviews).group(:id).order('avg desc')
  end
  
  def self.lowest_rated
    Book.select('books.*, avg(reviews.score)').joins(:reviews).group(:id).order('avg asc')
  end
end
