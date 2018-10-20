class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :company
      t.text :description
      t.string :category
      t.string :url

      t.timestamps null: false
    end
  end
end
