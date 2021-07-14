require 'rails_helper'

RSpec.describe 'new viewing party', type: :feature do
  xit 'create a party' do
    user1 = User.create(email: 'bob', password: '123')
    user2 = User.create(email: 'sue', password: '123')
    friendship = Friendship.create(follower: user1, followed: user2)

    visit movie_path(588228)

    click_button 'Create Viewing Party for Movie'

    expect(current_path).to eq(new_viewing_party_path)
  end
end
