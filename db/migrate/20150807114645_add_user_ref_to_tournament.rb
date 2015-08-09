class AddUserRefToTournament < ActiveRecord::Migration
  def change
    add_reference :tournaments, :user, index: true, foreign_key: true
  end
end
