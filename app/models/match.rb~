class Match < ActiveRecord::Base
  validates :venue, uniqueness: true
  belongs_to :game
  belongs_to :tournament
  has_many :scores, dependent: :destroy
  has_many :players, through: :scores
  accepts_nested_attributes_for :players
  def self.winner
    s = Score.order(points: :desc)
    p s
    Player.all.where(id: s.first.player_id).first.name
  end

end
