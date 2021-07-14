require 'rails_helper'

RSpec.describe GenreDataObject do
  describe 'happy path' do
    it "builds a genre object", :vcr do

    genre_data = APIService.get_genres_json[:genres]

    movie_genre = GenreDataObject.new(genre_data[0])

    expect(movie_genre).to be_a(GenreDataObject)
    expect(movie_genre.id).to be_a(Integer)
    expect(movie_genre.name).to be_a(String)
    end
  end
end
