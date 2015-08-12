class Player < ActiveRecord::Base
  validates :name, presence: :true, uniqueness: :true
  has_many :scores, dependent: :destroy
  has_many :matches ,through: :scores
  accepts_nested_attributes_for :scores
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
end
