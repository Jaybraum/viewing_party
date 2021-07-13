require 'rails_helper'

RSpec.describe ReviewData do

  it  'returns the first 8 reviews for a given movie' do
    movie_id = 588228

    response_body = File.read('spec/fixtures/review_data.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['API_KEY']}").
         to_return(status: 200, body: response_body, headers: {})

    movie_reviews = ReviewData.new(588228).top_eight_reviews
    # require 'pry'; binding.pry

    expect(movie_reviews.count).to eq(2)
    expect(movie_reviews[0][0]).to eq("garethmb")
    expect(movie_reviews[0][1].length).to eq(2350)
  end
end
