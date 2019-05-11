class Review < ApplicationRecord
  belongs_to :book
  before_save :titleize_review


  def titleize_review
    self.user = self.user.titleize
  end
end
