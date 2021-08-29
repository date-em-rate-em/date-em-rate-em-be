class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :client, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
