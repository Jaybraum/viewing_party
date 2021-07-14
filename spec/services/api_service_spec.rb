require 'rails_helper'

RSpec.describe APIService do
  it 'returns movie details', :vcr do
    movie_id = 588228

    details = APIService.get_movie_details_json(movie_id)

    expect(details).to be_a(Hash)
    expect(details[:title]).to be_a(String)
    expect(details[:popularity]).to be_a(Float)
    expect(details[:id]).to be_a(Integer)
  end

  it 'returns movie search', :vcr do
    title = 'Luca'

    data = APIService.movie_search_json(title)

    expect(data).to be_a(Hash)
    expect(data).to have_key(:first)
    expect(data[:first][0]).to be_a(Hash)
    expect(data[:first].length).to eq(20)
    expect(data[:second].length).to eq(20)
    expect(data[:first][0][:title]).to be_a(String)
    expect(data[:first][0][:popularity]).to be_a(Float)
    expect(data[:first][0][:id]).to be_a(Integer)
  end

  it 'returns movies', :vcr do
    page_num = 1

    data = APIService.get_movies_json(page_num)

    expect(data).to be_a(Hash)
    expect(data).to have_key(:results)
    expect(data[:results][0]).to be_a(Hash)
    expect(data[:results].length).to eq(20)
    expect(data[:results][0][:title]).to be_a(String)
    expect(data[:results][0][:popularity]).to be_a(Float)
    expect(data[:results][0][:id]).to be_a(Integer)
  end

  it 'returns top 40 movies', :vcr do

    data = APIService.get_top_rated_json

    expect(data).to be_a(Hash)
    expect(data).to have_key(:first)
    expect(data[:first][0]).to be_a(Hash)
    expect(data[:first].length).to eq(20)
    expect(data[:second].length).to eq(20)
    expect(data[:first][0][:title]).to be_a(String)
    expect(data[:first][0][:popularity]).to be_a(Float)
    expect(data[:first][0][:id]).to be_a(Integer)
  end

  it 'returns movie cast', :vcr do
    movie_id = 588228

    details = APIService.get_cast_json(movie_id)

    expect(details).to be_a(Hash)
    expect(details).to have_key(:cast)
    expect(details[:cast][0][:name]).to be_a(String)
    expect(details[:cast][0][:character]).to be_a(String)
  end

  it 'returns movie genres', :vcr do

    details = APIService.get_genres_json

    expect(details).to be_a(Hash)
    expect(details).to have_key(:genres)
    expect(details[:genres][0][:id]).to be_a(Integer)
    expect(details[:genres][0][:name]).to be_a(String)
  end

  it 'returns movie reviews', :vcr do
    movie_id = 588228

    details = APIService.get_reviews_json(movie_id)

    expect(details).to be_a(Hash)
    expect(details).to have_key(:results)
    expect(details[:results][0][:author]).to be_a(String)
    expect(details[:results][0][:content]).to be_a(String)
  end
end
