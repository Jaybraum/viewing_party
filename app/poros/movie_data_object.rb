class MovieDataObject
  attr_reader :genre_ids,
              :id,
              :overview,
              :popularity,
              :title,
              :vote_average
  def initialize(movie)
    require 'pry'; binding.pry
    @genre_id = movie[:genre_ids]
    @movie_id = movie[:id]
    @movie_overview = movie[:genre_ids]
    @popularity = movie[:popularity]
    @title = movie[:title]
    @vote_average = movie[:vote_average]
    # cast
    # runtime
    # reviews
  end
end
