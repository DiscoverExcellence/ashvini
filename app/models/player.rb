class Player < ActiveRecord::Base

  has_many :scores, dependent: :destroy
  has_many :matches ,through: :score
end
