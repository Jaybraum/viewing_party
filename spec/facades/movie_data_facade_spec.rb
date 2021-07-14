require 'rails_helper'

RSpec.describe MoviesDataFacade do
  describe 'methods' do
    it "gets movie details" do
      details = ''

      VCR.insert_cassette('builds_a_movie_details_object')
      details = MoviesDataFacade.get_movie_details_object(588228)


      expect(details).to be_an(MovieDetailsDataObject)
      expect(details.movie_id).to be_an(Integer)
      expect(details.title).to be_a(String)
      expect(details.vote_average).to be_a(Float)
      expect(details.cast).to be_a(Array)
      expect(details.reviews).to be_a(Array)
      expect(details.genres).to be_a(Array)
    end

    it 'gets movie title by id' do
      details = ''

      details = get_movie_title(588228)
      require "pry"; binding.pry
      expect(details).to be_an(MovieDetailsDataObject)
      expect(details.movie_id).to be_an(Integer)
    end

    it "find movie by title" do
      movie = ''
      title = 'Luca'

      VCR.use_cassette('searched by title') do
        movie = MoviesDataFacade.find_movies_by_title(title)
      end

      expect(movie).to be_an(Array)
      expect(movie[0].movie_id).to be_an(Integer)
      expect(movie[0].title).to eq('Luca')
    end

    it "gets top movie objects" do
      top_40 = ''
      id = 588228

      top_40 = MoviesDataFacade.get_top_movie_objects

      expect(top_40).to be_an(Array)
      expect(top_40[0]).to be_an(MovieSummaryDataObject)
      expect(top_40.length).to eq(40)
    end

    it "gets cast objects" do
      cast_data = ''
      id = 588228

      VCR.insert_cassette('builds_a_cast_data_object')

      cast_data = MoviesDataFacade.get_cast_objects(id)

      expect(cast_data).to be_an(Array)
      expect(cast_data[0]).to be_a(CastDataObject)
      expect(cast_data[0].character_name).to be_a(String)
      expect(cast_data[0].real_name).to be_a(String)
    end

    it "limits the amount of cast data" do
      cast_data = ''
      id = 588228

      cast_data = MoviesDataFacade.limited_cast(id)

      expect(cast_data).to be_an(Array)
      expect(cast_data.count).to eq(10)
      expect(cast_data[0]).to be_a(CastDataObject)
      expect(cast_data[0].character_name).to be_a(String)
      expect(cast_data[0].real_name).to be_a(String)
    end

    it "gets genre objects" do
      genre_data = ''

      VCR.insert_cassette('builds_a_genre_object')
      genre_data = MoviesDataFacade.get_genre_objects

      expect(genre_data).to be_an(Array)
      expect(genre_data[0]).to be_an(GenreDataObject)
      expect(genre_data[0].id).to be_a(Integer)
      expect(genre_data[0].name).to be_a(String)
    end

    it "gets movie genres" do
      genre_data = ''
      movie = APIService.get_movie_details_json(588228)

      genre_data = MoviesDataFacade.get_movie_genres(movie)

      expect(genre_data).to be_an(Array)
      expect(genre_data[0]).to be_a(String)
    end

    it "gets review objects" do
      review_data = ''
      id = 588228

      VCR.insert_cassette('builds_a_review_data_object')

      review_data = MoviesDataFacade.get_review_objects(id)

      expect(review_data).to be_an(Array)
      expect(review_data[0]).to be_a(ReviewDataObject)
      expect(review_data[0].author).to be_a(String)
      expect(review_data[0].review).to be_a(String)
    end

    it "limits amount of review objects" do
      review_data = ''
      id = 588228

      review_data = MoviesDataFacade.limited_reviews(id)

      expect(review_data).to be_an(Array)
      expect(review_data.count).to be <= 8
      expect(review_data[0]).to be_a(ReviewDataObject)
      expect(review_data[0].author).to be_a(String)
      expect(review_data[0].review).to be_a(String)
    end
  end
end
