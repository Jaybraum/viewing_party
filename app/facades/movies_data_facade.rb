class MoviesDataFacade

  def self.get_movie_objects
    movies = APIService.get_movies_json[:results]
    movies.map do |movie|
      MovieDataObject.new(movie)
    end
  end

  def self.find_movies_by_title(title)
    get_movie_objects.find_all do |movie|
      movie.title.downcase.include?(title)
    end
  end

  def self.get_top_movie_objects
    movies = APIService.get_top_rated_json[:results]
    movies.map do |movie|
      MovieDataObject.new(movie)
    end
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
    movie[:genre_ids].map do |genre_id|
      count = 0
      until genre_objects[count].id == genre_id
        count += 1
      end
      genre_objects[count].name
    end
  end

  def self.get_review_objects(movie_id)
    all_reviews = APIService.get_reviews_json(movie_id)[:reviews]
    all_reviews.map do |review|
      ReviewDataObject.new(review)
    end
  end

  def self.limited_reviews(movie_id)
    self.get_review_objects(movie_id)[0..7]
  end
end