class AddColumnPlayedonToGame < ActiveRecord::Migration
  def change
    add_column :games, :played_on, :string
    add_column :games, :date, :string
  end
end
