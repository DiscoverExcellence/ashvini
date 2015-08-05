class Player < ActiveRecord::Base

  has_many :scores
  has_many :matches ,through: :score
end
