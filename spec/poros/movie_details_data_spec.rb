require 'rails_helper'

RSpec.describe MovieDetailsDataObject do
  describe 'happy path' do
    it "builds a movie details object", :vcr do
    id = 588228

    movie_data = APIService.grab_movie_details_json(id)
    movie_data_facade = MoviesDataFacade

    movie_details = MovieDetailsDataObject.new(movie_data, movie_data_facade)

    expect(movie_details).to be_a(MovieDetailsDataObject)
    expect(movie_details.movie_id).to be_a(Integer)
    expect(movie_details.title).to be_a(String)
    expect(movie_details.vote_average).to be_a(Float)
    expect(movie_details.cast).to be_a(Array)
    expect(movie_details.reviews).to be_a(Array)
    expect(movie_details.genres).to be_a(Array)
    expect(movie_details.runtime).to be_a(Integer)
    end
  end
end
