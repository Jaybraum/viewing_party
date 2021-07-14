class Friendship < ApplicationRecord
  belongs_to :follower, :class_name => :User, :foreign_key => "follower_id"
  belongs_to :followed, :class_name => :User, :foreign_key => "followed_id"

  def self.users_friends(user)
    friend_ids = where(follower_id: user.id).pluck(:followed_id)
    User.where(id: friend_ids)
  end
end
