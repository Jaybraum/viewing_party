require 'rails_helper'

describe Friendship, type: :model do
  describe "validations" do
    # doesnt work, not sure what to do with this
    it {should belong_to(:follower)}
  end

  describe "class methods" do
    it 'returns all the friends emails for a givn user' do
      user1 = User.create(email: 'bob', password: '123')
      user2 = User.create(email: 'sue', password: '123')
      friendship = Friendship.create(follower: user1, followed: user2)

      expect(Friendship.users_friends(user1)).to eq(['sue'])
    end
  end
end
