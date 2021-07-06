require 'rails_helper'

RSpec.describe 'admin index page', type: :feature do

  describe 'page appearance' do
    it 'welcomes' do
      visit '/'

      expect(page).to have_content('Welcome to Viewing Party')
    end
  end

  describe "User registration form" do
    it "creates new user" do
      visit root_path

      click_on "Register as a User"

      expect(current_path).to eq(new_user_path)

      username = "funbucket13"
      password = "test"

      fill_in :username, with: username
      fill_in :password, with: password

      click_on "Create User"

      expect(page).to have_content("Welcome, #{username}!")
    end
  end
end
