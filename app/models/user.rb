class User < ApplicationRecord
  has_many :friendships, foreign_key: "follower_id"
  has_many :friendships, foreign_key: "followed_id"
  has_many :parties
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  enum role: ['user', 'admin']

  def user_parties
    parties_hosting = Party.where(host_id: self.id).pluck(:id)
    parties_participating = PartyParticipant.where(user_id: self.id).pluck(:party_id)
    all_party_ids = parties_hosting + parties_participating
    Party.distinct.where(id: all_party_ids)
  end
end
