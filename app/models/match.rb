class Match < ActiveRecord::Base
  validates :venue, uniqueness: true
  belongs_to :game
  belongs_to :tournament
  has_many :scores, dependent: :destroy
  has_many :players, through: :scores
  accepts_nested_attributes_for :players
  def winner

    winner= scores.select("player_id").order(points: :desc).first
    if winner
      return winner.player.name if winner.player
      return "Yet To Play" unless winner.player
    else 
      p "No Winner"
    end
  end
 
end
