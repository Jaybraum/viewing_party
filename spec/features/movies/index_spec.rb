require 'rails_helper'

RSpec.describe "Movies index page" do
  it 'top rated movies search', :vcr do

    visit movies_path

    movies = MoviesDataFacade.get_top_movie_objects

    click_button 'Find Top Rated Movies'

    expect(current_path).to eq(movies_path)

    expect(page.status_code).to eq 200

    within(".top_40") do
      expect(page.all('a', count: 40))
      expect(movies.first.title).to appear_before(movies.second.title)
      expect(movies.first.vote_average).to be > movies[1].vote_average
    end
  end

  it 'Can search for movies', :vcr do

    visit movies_path

    fill_in :search, with: 'Luca'
    click_button 'Search'

    expect(current_path).to eq(movies_path)

    expect(page.status_code).to eq 200
    expect(page).to have_content('Luca')
    expect(page).to have_content('Vote Average 8.1')
  end
end
