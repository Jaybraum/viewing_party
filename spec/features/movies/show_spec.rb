require 'rails_helper'

RSpec.describe "movies show page" do
  before :each do
    user = User.new(email: 'w', password: 'w')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit movie_path(588228)
  end

  describe "Page details" do
    VCR.insert_cassette('builds_a_movie_details_object')
    it 'displays the movie title' do
      expect(page).to have_content('The Tomorrow War')
    end

    it 'movie details' do
      expect(page).to have_content('Vote Average: 8.3')
      expect(page).to have_content('Runtime: 138 min')
      expect(page).to have_content('Genre(s): Action Science Fiction')
     end

    it 'reviews' do
      expect(page).to have_content("Review Author: garethmb")
      expect(page).to have_content("Review Author: msbreviews")
      expect(page).to have_content("Review Author: Kamurai")
     end
   end

   describe "Page details" do
    it "has a link to create a viewing party" do
      expect(page).to have_button("Create Viewing Party for The Tomorrow War")

      click_on "Create Viewing Party for The Tomorrow War"

      expect(current_path).to eq(new_party_path)
    end
  end
end
