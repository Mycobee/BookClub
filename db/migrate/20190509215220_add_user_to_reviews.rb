class AddUserToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :user, :string
  end
end
