require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it {should have_many(:book_authors)}
    it {should have_many(:authors).through(:book_authors)}
    it {should have_many(:reviews)}
  end

  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:pages)}
    it {should validate_presence_of(:pub_year)}

    it {should validate_numericality_of(:pages)}
    it {should validate_numericality_of(:pub_year)}

   it {should validate_inclusion_of(:pages).in_range(1..15000)}
   it {should validate_inclusion_of(:pub_year).in_range(1455..2025)}

  # it {should validate_uniqueness_of(:title)}
  end

  # describe 'instance methods' do
  #
  # end
  #
  # describe 'class methods' do
  #
  # end


end
