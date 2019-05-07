class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.integer :pub_year
      t.string :thumb_url

      t.timestamps
    end
  end
end
