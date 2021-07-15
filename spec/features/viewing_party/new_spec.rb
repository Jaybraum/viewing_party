require 'rails_helper'

RSpec.describe 'new viewing party', type: :feature do
  before :each do
    user = User.new(email: 'w', password: 'w')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit movie_path(588228)

    click_on "Create Viewing Party for The Tomorrow War"
  end

  it 'creates a viewing party for a movie', :vcr do
    expect(current_path).to eq(new_party_path)
    expect(page).to have_content('Create Viewing Party for The Tomorrow War')
    expect(page).to have_content('Duration of Party (minutes)')
    expect(page).to have_content('Event Date')
    expect(page).to have_content('Invitees')
  end
end
