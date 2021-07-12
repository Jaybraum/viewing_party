require './config/initializers/constants'

class MovieData
  def initialize
    @movies = APIService.connect(DISCOVER_PATH)[:results]
  end

  def top_forty
    @movies.take(40)
  end

  def search(search_params)
    @movies.find do |movie|
      movie[:original_title] == search_params
    end
  end

  def movie_details(movie)
    require 'pry'; binding.pry
   {
      :title => movie[:title],
      :vote_average => movie[:vote_average],
      :runtime => APIService.connect("https://api.themoviedb.org/3/movie/#{movie[:id]}?api_key=")[:runtime],
      :genres => GenreData.new.movie_genres(movie),
      :summary => movie[:overview],
      :cast => CastData.new(movie[:id]).top_ten_cast,
      :reviews => ReviewData.new(movie[:id]).top_eight_reviews,
    }
  end
end
