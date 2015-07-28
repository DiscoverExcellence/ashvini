class AddGameRefToTournament < ActiveRecord::Migration
  def change
    add_reference :tournaments, :game, index: true, foreign_key: true
  end
end
