class AddPlayerRefToScore < ActiveRecord::Migration
  def change
    add_reference :scores, :player, index: true, foreign_key: true
  end
end
