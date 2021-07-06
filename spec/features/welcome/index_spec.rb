require 'rails_helper'

RSpec.describe 'admin index page', type: :feature do

  describe 'page appearance' do
    xit 'welcomes' do
      visit '/'

      expect(page).to have_content('Welcome to Viewing Party')
    end
  end

  describe "User registration form" do
    it "creates new user" do
      visit root_path

      click_on "Register as a User"

      expect(current_path).to eq(register_path)

      email = "funbucket13@123.com"
      password = "test"

      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password

      click_on "Create User"

      expect(page).to have_content("Welcome, #{email}!")
    end
  end
end
