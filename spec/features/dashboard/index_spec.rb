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
  end
end