class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :massages

  def admin?
    false
  end
end
