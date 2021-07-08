class MovieData
  attr_reader :data
  def initialize
    @movie_data = APIService.connect(Constant::MOVIE_PATH)
  end
end