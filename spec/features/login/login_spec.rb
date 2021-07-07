require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(email: "bob", password: "123")

    visit login_path

    expect(current_path).to eq(login_path)

    within "#login_form" do
      fill_in :email, with: 'bob'
      fill_in :password, with: '123'
    end

    click_on "Log In"

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_content("Welcome, bob")
  end
  it "throws an error if email is not attached to a user" do
    visit login_path

    expect(current_path).to eq(login_path)

    within "#login_form" do
      fill_in :email, with: 'bob'
      fill_in :password, with: '123'
    end

    click_on "Log In"

    expect(current_path).to eq(login_path)

    expect(page).to have_content("The provided email is not associated with an account. Please register or try again.")
  end
  it "throws an error if password is wrong" do
    user = User.create(email: "bob", password: "123")

    visit '/login'

    expect(current_path).to eq(login_path)

    within "#login_form" do
      fill_in :email, with: 'bob'
      fill_in :password, with: '1234'
    end

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("The password provided is incorrect. Please try again.")
  end
end