require 'rails_helper'

RSpec.describe 'welcome page', type: :feature do

  describe 'page appearance' do
    it 'welcomes' do
      visit '/'

      expect(page).to have_content('Welcome to Viewing Party')
    end
  end

  describe "Link to registration form" do
    it "Has a link to the new user registration page" do
      visit root_path

      click_on "Register"

      expect(current_path).to eq(register_path)
    end
  end

  describe "Link to login form" do
    it "Has a link to the  user login page" do
      visit root_path

      click_on "Login"

      expect(current_path).to eq(login_path)
    end
  end
end
