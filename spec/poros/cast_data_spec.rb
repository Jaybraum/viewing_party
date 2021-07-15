require 'rails_helper'

RSpec.describe CastDataObject do
  describe 'happy path' do
    it "builds a cast object", :vcr do

    cast_data = APIService.grab_cast_json(588228)[:cast]

    movie_cast = CastDataObject.new(cast_data[0])

    expect(movie_cast).to be_a(CastDataObject)
    expect(movie_cast.real_name).to be_a(String)
    expect(movie_cast.character_name).to be_a(String)
    end
  end
end
