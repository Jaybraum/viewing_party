require 'rails_helper'

RSpec.describe "Dashboard Index" do
  describe "page routing" do
    it "has a button that links to the movies index page" do
      user = User.new(email: 'w', password: 'w')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_index_path

      click_link 'Discover Movies'

      expect(current_path).to eq(movies_path)
    end
    it "if a user has no friends, it tell them that" do
      user = User.new(email: 'w', password: 'w')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_index_path

      expect(page).to have_content("You currently have no friends added.")
    end
    it "if a user has no friends, it lists them" do
      user1 = User.create(email: 'bob', password: '123')
      user2 = User.create(email: 'sue', password: '123')
      user3 = User.create(email: 'frank', password: '123')
      friendship1 = Friendship.create!(follower: user1, followed: user2)
      friendship2 = Friendship.create!(follower: user1, followed: user3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      
      visit dashboard_index_path

      expect(page).to have_content("sue")
      expect(page).to have_content("frank")
    end
  end
end