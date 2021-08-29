class AddCollumnsToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :size, :float
    add_column :reviews, :payment, :integer
    add_column :reviews, :extended_body, :string
    add_column :reviews, :kindness, :integer
    add_column :reviews, :vibe, :integer
    add_column :reviews, :date_again, :boolean
    add_column :reviews, :safety_meter, :integer
    add_column :reviews, :gender, :string
  end
end
