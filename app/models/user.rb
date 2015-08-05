class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
 # before_action :authenticate_user!
 # has_secure_password
 # attr_accessor :password_digest
ROLES = %i[admin tournament_manager player_manager user ]
end

