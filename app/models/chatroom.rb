class Chatroom < ApplicationRecord
  paginates_per 4
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages
end
