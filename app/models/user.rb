class User < ApplicationRecord
  has_many :friendships, foreign_key: 'follower_id', dependent: :destroy, inverse_of: :user
  has_many :friendships, foreign_key: 'followed_id', dependent: :destroy, inverse_of: :user
  has_many :parties, dependent: :destroy
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  enum role: { 'user' => 0, 'admin' => 1 }

  def parties_hosting
    Party.where(host_id: id)
  end

  def parties_participating
    party_ids = PartyParticipant.where(user_id: id).pluck(:party_id)
    Party.distinct.where(id: party_ids)
  end

  def grab_friends
    friend_ids = Friendship.where(follower_id: id).pluck(:followed_id)
    User.where(id: friend_ids)
  end
end
