require 'rails_helper'

RSpec.describe CastData do
  xit 'has data' do

  end

  it 'lists all movies' do
    movie_data = CastData.new(588228)



    expect(movie_data.top_ten_cast).to be_an(Array)
  end
end
