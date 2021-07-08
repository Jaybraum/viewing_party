#require './config/initializers/constants'

class MovieData
  attr_reader :data
  def initialize
    @movie_data = APIService.connect(MOVIE_PATH)
  end
end
