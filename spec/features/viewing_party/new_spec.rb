require 'rails_helper'

RSpec.describe 'new viewing party', type: :feature do
  @user_1 = User.create!(email: 'J@gmail.com', password: 'mrmiyagi')
  @user_2 = User.create!(email: 'N@gmail.com', password: '123456')
  @friend_1 = Friendship.create!(follower_id: @user_1.id, followed_id: @user_2.id)
