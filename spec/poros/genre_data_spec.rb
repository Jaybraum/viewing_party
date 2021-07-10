require 'rails_helper'

RSpec.describe GenreData do
  xit 'has data' do

  end

  it 'lists all movies' do
    movie_data = MovieData.new


    expect(movie_data.inject_genre).to be_an(Array)
  end
end
