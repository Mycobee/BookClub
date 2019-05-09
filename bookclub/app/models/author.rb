class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors
  accepts_nested_attributes_for :books
end
