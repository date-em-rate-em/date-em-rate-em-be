class DurationIntergerToFloat < ActiveRecord::Migration[5.2]
  def change
      remove_column :reviews, :duration
    add_column :reviews, :duration, :float
  end
end
