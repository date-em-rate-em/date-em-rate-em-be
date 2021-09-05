class AddHelenReviewColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :hygine, :integer
    add_column :reviews, :punctuality, :string
    add_column :reviews, :condoms, :string
    add_column :reviews, :duration, :integer
  end
end
