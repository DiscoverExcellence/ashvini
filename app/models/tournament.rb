#require 'will_paginate'
class Tournament < ActiveRecord::Base
  has_many :matches
  has_many :scores
  belongs_to :game
  accepts_nested_attributes_for :matches
  
  def hello
    p "Hello"
  end
  def winner
    winner= scores.select("player_id").group(:player_id).order("sum(points) desc").first
    if winner
      winner.player.name 
    else 
      p "No Winner"
    end


  end

  def top_five_player
    top_five_array = []
    top_five = scores.select("player_id").group("player_id").order("sum(points) desc").first(2)
    top_five.each do |t|
      top_five_array << t.player.name
    end
    top_five_array
  end

end
