require 'rails_helper'

RSpec.describe MovieData do
  xit 'has data' do
    mock_response = {
      :adult=> false,
       :backdrop_path=> "/620hnMVLu6RSZW6a5rwO8gqpt0t.jpg",
       :genre_ids=> [16, 35, 10751, 14],
       :id=> 508943,
       :original_language=> "en",
       :original_title=> "Luca",
       :overview=> "Luca and his best friend Alberto experience an unforgettable
                    summer on the Italian Riviera. But all the fun is threatened
                    by a deeply-held secret: they are sea monsters from another
                    world just below the water’s surface.",
       :popularity=> 4280.651,
       :poster_path=> "/jTswp6KyDYKtvC52GbHagrZbGvD.jpg",
       :release_date=> "2021-06-17",
       :title=> "Luca",
       :video=> false,
       :vote_average=> 8.2,
       :vote_count=> 2239
    }
    #this can use VCR, for now we can comment out the mock data to check on the API
    allow(APIService).to receive(:connect).and_return(mock_response)
    movie_data = MovieData.new
    expect(movie_data).to be_an_instance_of(MovieData)
  end

  xit 'lists all movies' do
    movie_data = MovieData.new

    expect(movie_data.top_forty).to be_an(Array)
  end
end
