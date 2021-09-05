class RemoveUnusedReviewColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :title
    remove_column :reviews, :extended_body
    remove_column :reviews, :kindness
  end
end
