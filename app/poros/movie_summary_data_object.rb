class MovieSummaryDataObject
  attr_reader :movie_id,
              :title,
              :vote_average

  def initialize(movie, movie_data_facade)
    @movie_id = movie[:id]
    @title = movie[:title]
    @vote_average = movie[:vote_average]
  end
end
