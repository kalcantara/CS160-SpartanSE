class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :category
      t.string :address
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
