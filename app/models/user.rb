class User < ApplicationRecord
  has_many :friendships, foreign_key: "follower_id"
  has_many :friendships, foreign_key: "followed_id"
  has_many :parties
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  enum role: ['user', 'admin']

  def parties_hosting
    Party.where(host_id: self.id)
  end

  def parties_participating
    party_ids = PartyParticipant.where(user_id: self.id).pluck(:party_id)
    Party.distinct.where(id: party_ids)
  end

  def get_friends
    friend_ids = Friendship.where(follower_id: self.id).pluck(:followed_id)
    User.where(id: friend_ids)
  end
end
