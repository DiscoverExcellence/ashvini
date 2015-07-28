class Game < ActiveRecord::Base
  has_many :matches, dependent: :destroy
  has_many :tournaments
  validates :name, uniqueness: :true
end
