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
  it "it has a form to add a new friend and tells you if the addition was a success" do
    user1 = User.create(email: 'bob', password: '123')
    user2 = User.create(email: 'sue', password: '123')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    # What in the world is going on here? Why do I need to do this?
    allow_any_instance_of(FriendshipsController).to receive(user_id).and_return(user1.id)
    allow_any_instance_of(DashboardController).to receive(:current_user).and_return(user1)

    visit dashboard_index_path

    expect(page).to have_content("Add New Friend By Email:")

    fill_in :followed, with: 'sue'

    click_on "Add"

    expect(page).to have_content('sue has been added to your friends list!')
  end
  it "it does not allow you to add friends that dont exist" do
    user1 = User.create(email: 'bob', password: '123')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    # What in the world is going on here? Why do I need to do this?
    allow_any_instance_of(FriendshipsController).to receive(user_id).and_return(user1)
    allow_any_instance_of(DashboardController).to receive(:current_user).and_return(user1)

    visit dashboard_index_path

    fill_in :followed, with: 'sue'

    click_on "Add"

    expect(page).to have_content('The provided email is not associated with an account. Please try again.')
  end
  it "it does not let you add friends that you already have" do
    user1 = User.create(email: 'bob', password: '123')
    user2 = User.create(email: 'sue', password: '123')
    Friendship.create!(follower: user1, followed: user2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    # What in the world is going on here? Why do I need to do this?
    allow_any_instance_of(FriendshipsController).to receive(user_id).and_return(user1.id)
    allow_any_instance_of(DashboardController).to receive(:current_user).and_return(user1)

    visit dashboard_index_path

    fill_in :followed, with: 'sue'

    click_on "Add"

    expect(page).to have_content('You are already friends with this individual!')
  end
end