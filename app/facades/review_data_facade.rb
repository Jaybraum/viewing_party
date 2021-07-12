class ReviewDataFacade
  def get_all_reviews(movie_id)
    APIService.connect("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=")[:reviews]
  end

  def self.get_review_objects(movie_id)
    all_reviews = self.get_all_reviews(movie_id)
    all_reviews.map do |review|
      ReviewDataObject.new(review)
    end
  end

  def self.limited_reviews(movie_id)
    all_reviews = self.get_review_objects(movie_id)
    limited_reviews = self.limited_reviews_count(all_reviews.count)

    all_reviews.first(limited_reviews_count)
  end

  private

  def self.limited_reviews_count(all_reviews_count)
    if all_reviews_count < 8
      all_reviews_count
    else
      8
    end
  end
end