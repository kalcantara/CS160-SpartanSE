class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user
      t.text :body
      t.references :reviews, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
