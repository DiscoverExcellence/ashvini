class AddScoreRefToMatch < ActiveRecord::Migration
  def change
    add_reference :matches, :score, index: true, foreign_key: true
  end
end
