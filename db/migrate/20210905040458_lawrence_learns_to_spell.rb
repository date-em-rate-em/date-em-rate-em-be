class LawrenceLearnsToSpell < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :hygine, :hygiene
  end
end
