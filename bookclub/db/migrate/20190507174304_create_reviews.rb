class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.string :heading
      t.text :full_review
      t.references :book

      t.timestamps
    end
  end
end
