require 'rails_helper'

RSpec.describe GenreData do

  it  'returns the generes for a given movie' do
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

    response_body = File.read('spec/fixtures/genre_data.json')

    stub_request(:get, "https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV['API_KEY']}").
         to_return(status: 200, body: response_body, headers: {})

    expect(GenreData.new.movie_genres(movie)).to eq(["Action", "Science Fiction"])
  end
end
