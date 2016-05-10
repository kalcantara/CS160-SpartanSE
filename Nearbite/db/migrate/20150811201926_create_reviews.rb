class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.references :business, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :reviews, :business_id
  end
end
