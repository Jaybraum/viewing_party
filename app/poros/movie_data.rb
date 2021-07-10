#require './config/initializers/constants'

class MovieData
  def initialize
    @movie_data = APIService.connect(DISCOVER_PATH)
  end

  def top_forty
    @movie_data.take(40)
  end

  def search(search_params)
    movies = @movie_data[:results]
    movies.find do |movie|
      movie[:original_title] == search_params
    end
  end
end
