require 'rails_helper'

RSpec.describe MovieSummaryDataObject do
  describe 'happy path' do
    it "builds a movie summary object" do
    VCR.insert_cassette('builds_a_movie_details_object')
    id = 588228

    movie_data = APIService.get_movie_details_json(id)
    movie_data_facade = MoviesDataFacade

    movie_details = MovieSummaryDataObject.new(movie_data, movie_data_facade)

    expect(movie_details).to be_a(MovieSummaryDataObject)
    expect(movie_details.movie_id).to be_a(Integer)
    expect(movie_details.title).to be_a(String)
    expect(movie_details.vote_average).to be_a(Float)
    end
  end
end
