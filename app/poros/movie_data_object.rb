class MovieDataObject
  attr_reader :genre_ids,
              :id,
              :overview,
              :popularity,
              :title,
              :vote_average
  def initialize(movies)
    @genre_id = movies[:genre_ids]
    @movie_id = movies[:id]
    @movie_overview = movies[:genre_ids]
    @popularity = movies[:popularity]
    @title = movies[:title]
    @vote_average = movies[:vote_average]
  end
end
