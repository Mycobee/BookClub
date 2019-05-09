class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews
  accepts_nested_attributes_for :authors

  validates :title, presence: true, uniqueness: true
  validates :pages, presence: true, numericality: true, inclusion: { in: 1..15000 }
  validates :pub_year, presence: true, numericality: true, inclusion: { in: 1455..2025}

  before_save  {self.title = self.title.titleize}
end
