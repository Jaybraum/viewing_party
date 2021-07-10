require 'rails_helper'

RSpec.describe CastData do

  it  'returns the first 10 cast members names and characters for a given movie' do
    movie_id = 588228

    response_body = File.read('spec/fixtures/cast_data.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['API_KEY']}").
         to_return(status: 200, body: response_body, headers: {})

    movie_cast = CastData.new(588228)

    expect(movie_cast.top_ten_cast).to eq([["Chris Pratt", "Dan Forester"],
                                            ["Yvonne Strahovski", "Romeo Command"],
                                            ["J.K. Simmons", "Slade"],
                                            ["Betty Gilpin", "Emmy"],
                                            ["Sam Richardson", "Charlie"],
                                            ["Edwin Hodge", "Dorian"],
                                            ["Jasmine Mathews", "Lt. Hart"],
                                            ["Seychelle Gabriel", "Sgt. Diaz"],
                                            ["Alan Trong", "Lt. Tran"],
                                            ["Chibuikem Uche", "Lt. Ikemba"]])
  end
end
