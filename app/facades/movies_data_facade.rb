class MoviesDataFacade
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

  def self.generate_cast_objects(movie_id)
    cast = APIService.grab_cast_json(movie_id)[:cast]
    cast.map do |cast_member|
      CastDataObject.new(cast_member)
    end
  end

  def self.generate_movie_details_object(movie_id)
    movie = APIService.grab_movie_details_json(movie_id)
    MovieDetailsDataObject.new(movie, self)
  end

  def self.grab_movie_genres(movie)
    movie[:genres].map do |genre|
      genre[:name]
    end
  end

  def self.grab_movie_runtime(movie_id)
    APIService.grab_movie_details_json(movie_id)[:runtime]
  end

  def self.grab_movie_title(movie_id)
    APIService.grab_movie_details_json(movie_id)[:title]
  end

  def self.generate_review_objects(movie_id)
    all_reviews = APIService.grab_reviews_json(movie_id)[:results]
    all_reviews.map do |review|
      ReviewDataObject.new(review)
    end
  end

  def self.generate_top_movie_objects
    movies_pages = APIService.grab_top_rated_json
    all_movies = []
    movies_pages.each do |movies|
      movies[1].each do |movie|
        all_movies << MovieSummaryDataObject.new(movie, self)
      end
    end
    all_movies
  end

  def self.limited_cast(movie_id)
    generate_cast_objects(movie_id)[0..9]
  end

  def self.limited_reviews(movie_id)
    generate_review_objects(movie_id)[0..7]
  end
end
