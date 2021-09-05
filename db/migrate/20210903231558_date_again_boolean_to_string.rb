class DateAgainBooleanToString < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :date_again, :string
  end
end
