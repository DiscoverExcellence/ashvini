class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.string :scoring_pts

      t.timestamps null: false
    end
  end
end
