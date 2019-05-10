require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'relationships' do
    it {should have_many :book_authors}
    it {should have_many(:books).through(:book_authors)}
  end
  #
  # describe 'validations' do
  #
  # end
  #
  # describe 'instance methods' do
  #
  # end
  #
  # describe 'class methods' do
  #
  # end


end
