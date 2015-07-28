class Tournament < ActiveRecord::Base
  has_many :matches
  has_many :scores
  belongs_to :game
  def winner
    winner= scores.select("player_id").group(:player_id).order("sum(points) desc").first
    winner.player.name
  end

  def top_five_player
    top_five = scores.select("player_id").group("player_id").order("sum(points) desc").first(5)
  end

end
