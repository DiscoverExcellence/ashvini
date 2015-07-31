class Game < ActiveRecord::Base
  has_many :matches, dependent: :destroy
  accepts_nested_attributes_for :matches
  has_many :tournaments, dependent: :destroy
  validates :name,presence: true, uniqueness: :true
end
