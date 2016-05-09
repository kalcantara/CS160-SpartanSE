class ChangeNames < ActiveRecord::Migration
  def change
  rename_column :comments, :"reviews_id", :"review_id"
  end
end
