require 'rails_helper'

RSpec.describe "Dashboard Index" do
  describe "page routing" do
    it "has a button that links to the movies index page" do
      visit dashboard_index_path

      click_link 'Discover Movies'

      expect(current_path).to eq(movies_path)
    end
  end
end