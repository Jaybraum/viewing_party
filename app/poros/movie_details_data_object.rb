class MovieDetailsDataObject
  attr_reader :movie_id,
              :summary,
              :title,
              :vote_average,
              :cast,
              :reviews,
              :genres,
              :runtime

  def initialize(movie, movie_data_facade)
    @movie_id = movie[:id]
    @summary = movie[:overview]
    @title = movie[:title]
    @vote_average = movie[:vote_average]
    @cast = movie_data_facade.limited_cast(@movie_id)
    @reviews = movie_data_facade.limited_reviews(@movie_id)
    @genres = movie_data_facade.get_movie_genres(movie)
    @runtime = movie[:runtime]
  end
end
