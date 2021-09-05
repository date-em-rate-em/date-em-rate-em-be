class RemoveDateAgainFromReview < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :date_again
    add_column :reviews, :date_again, :string
  end
end
