require 'rails_helper'

RSpec.describe "movies show page" do

  xit "displays the item and its attributes", :vcr do

    movies = MovieData.new
    movie_details = movies.movie_details(movie)

    visit "/movies/58828"

    expect(page).to have_content(movie_details[:title])
    expect(page).to have_content(movie_details[:vote_average])
    expect(page).to have_content(movie_details[:runtime])
    expect(page).to have_content("Genre(s): Action Science Fiction")
    expect(page).to have_content(movie_details[:summary])
    expect(page).to have_content(movie_details[:cast][0][0])
    expect(page).to have_content(movie_details[:cast][0][1])
    expect(page).to have_content(movie_details[:cast][9][0])
    expect(page).to have_content(movie_details[:cast][9][1])
    expect(page).to have_content(movie_details[:reviews][0][0])
    expect(page).to have_content("on the verge of extinction.")
    expect(page).to have_content("The film features some good FX")
  end
end
