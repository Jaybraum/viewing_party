class User < ApplicationRecord
  has_many :friendships, foreign_key: "follower_id"
  has_many :friendships, foreign_key: "followed_id"
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  enum role: ['user', 'admin']
end
