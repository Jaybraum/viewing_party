require 'rails_helper'

RSpec.describe 'new user registration page', type: :feature do

  describe 'page appearance' do
    it 'contains fields for email, password, and password confirmation' do
      visit register_path

      expect(page).to have_content('Email:')
      expect(page).to have_content('Password:')
      expect(page).to have_content('Password Confirmation:')
      expect(page).to have_button('Create User')
    end
  end

  describe "Page functionality" do
    it "throws an error and stays on page if user already exists" do
      User.create(email: 'bob', password: '123')

      visit register_path

      within "#login_form" do
        fill_in "user[email]", with: 'bob'
        fill_in "user[password]", with: '123'
        fill_in "user[password_confirmation]", with: '123'
      end

      click_on "Create User"

      expect(page).to have_content("This email is already associated with an account. Please log in.")
      expect(current_path).to eq(register_path)
    end
    it "throws an error and stays on page if passwords dont match" do
      visit register_path

      within "#login_form" do
        fill_in "user[email]", with: 'bob'
        fill_in "user[password]", with: '123'
        fill_in "user[password_confirmation]", with: '1234'
      end

      click_on "Create User"

      expect(page).to have_content("Passwords do not match! Please enter the same password twice.")
      expect(current_path).to eq(register_path)
    end
    it "it creates new user with proper credentials and redirects to dashboard page" do
      visit register_path

      within "#login_form" do
        fill_in "user[email]", with: 'bob'
        fill_in "user[password]", with: '123'
        fill_in "user[password_confirmation]", with: '123'
      end

      click_on "Create User"

      expect(page).to have_content("Welcome, bob!")
      expect(current_path).to eq(dashboard_index_path)
    end
  end
end
