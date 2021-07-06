require 'rails_helper'

RSpec.describe 'admin index page', type: :feature do

  describe 'page appearance' do
    it 'welcomes' do
      visit '/'

      expect(page).to have_content('Welcome to Viewing Party')
    end
  end

  describe "Link to form" do
    it "Has a link to the new user registration page" do
      visit root_path

      click_on "Register as a User"

      expect(current_path).to eq(register_path)
    end
  end
end
