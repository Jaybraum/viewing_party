require 'rails_helper'

RSpec.describe "movies show page" do

  it "displays the item and its attributes" do
    movie = {
              "adult": false,
              "backdrop_path": "/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg",
              "genre_ids": [
                  28,
                  878
              ],
              "id": 588228,
              "original_language": "en",
              "original_title": "The Tomorrow War",
              "overview": "The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.",
              "popularity": 5807.273,
              "poster_path": "/xipF6XqfSYV8DxLqfLN6aWlwuRp.jpg",
              "release_date": "2021-07-02",
              "title": "The Tomorrow War",
              "video": false,
              "vote_average": 8.4,
              "vote_count": 1809
            }

    response_body = File.read('spec/fixtures/movies_data.json')

    stub_request(:get, "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['API_KEY']}").
         to_return(status: 200, body: response_body, headers: {})

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
