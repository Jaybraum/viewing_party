require 'rails_helper'

RSpec.describe ReviewData do
  xit 'has data' do

  end

  it 'lists all movies' do
    movie_data = ReviewData.new(588228)



    expect(movie_data.top_eight_reviews).to be_an(Array)
  end
end
