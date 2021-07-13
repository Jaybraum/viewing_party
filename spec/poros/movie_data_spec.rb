require 'rails_helper'

RSpec.describe MovieDetailsDataObject do

  it  'returns a list of movies' do
    # response_body = File.read('spec/fixtures/movie_data.json')
    #
    # stub_request(:get, DISCOVER_PATH + ENV['API_KEY']).
    #      to_return(status: 200, body: response_body, headers: {})
    #
    # movie_reviews = MovieData.new


    expect(movie_reviews.count).to eq(2)
    expect(movie_reviews[0][0]).to eq("garethmb")
    expect(movie_reviews[0][1].length).to eq(2350)
  end
end
