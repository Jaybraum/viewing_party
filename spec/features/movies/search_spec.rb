require 'rails_helper'

RSpec.describe "Search for movies" do

  it  'Can search for movies' do

    response_body = File.read('spec/fixtures/movies.json')

    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['API_KEY']}").
         to_return(status: 200, body: response_body, headers: {})

    visit movies_path

    fill_in :search, with: 'Luca'
    click_button 'Search'

    expect(page.status_code).to eq 200
    expect(page).to have_content('Luca')
  end
end
