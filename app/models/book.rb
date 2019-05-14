class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors


  validates :title, presence: true, uniqueness: true
  validates :pages, presence: true, numericality: true, inclusion: { in: 1..15000 }
  validates :pub_year, presence: true, numericality: true, inclusion: { in: 1455..2025}

  before_save  {self.title = self.title.titleize}

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

  def self.highest_rated
    Book.select('books.id, avg(reviews.score)').joins(:reviews).group(:id).order('avg desc').limit(3)
  end

  def self.lowest_rated
    Book.select('books.id, avg(reviews.score)').joins(:reviews).group(:id).order('avg asc').limit(3)
  end
end
