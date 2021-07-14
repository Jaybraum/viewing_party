class MoviesDataFacade

  def self.get_movie_details_object(movie_id)
    movie = APIService.get_movie_details_json(movie_id)
    MovieDetailsDataObject.new(movie, self)
  end

  def get_movie_title(movie_id)
    movie = APIService.get_movie_details_json(movie_id)[:title]
  end

  def self.find_movies_by_title(title)
    movies_pages = APIService.movie_search_json(title)
    all_movies = []
    movies_pages.each do |movies|
      movies[1].each do |movie|
        all_movies << MovieSummaryDataObject.new(movie, self)
      end
    end
    all_movies
  end

  def self.get_top_movie_objects
    movies_pages = APIService.get_top_rated_json
    all_movies = []
    movies_pages.each do |movies|
      movies[1].each do |movie|
        all_movies << MovieSummaryDataObject.new(movie, self)
      end
    end
    all_movies
  end

  def self.get_cast_objects(movie_id)
    cast = APIService.get_cast_json(movie_id)[:cast]
    cast.map do |cast_member|
      CastDataObject.new(cast_member)
    end
  end

  def self.limited_cast(movie_id)
    self.get_cast_objects(movie_id)[0..9]
  end

  def self.get_genre_objects
    genres = APIService.get_genres_json[:genres]
    genres.map do |genre|
      GenreDataObject.new(genre)
    end
  end

  def self.get_movie_genres(movie)
    genre_objects = self.get_genre_objects
    movie[:genres].map do |genre|
      genre[:name]
    end
  end

  def self.get_review_objects(movie_id)
    all_reviews = APIService.get_reviews_json(movie_id)[:results]
    all_reviews.map do |review|
      ReviewDataObject.new(review)
    end
  end

  def self.limited_reviews(movie_id)
    self.get_review_objects(movie_id)[0..7]
  end
end
