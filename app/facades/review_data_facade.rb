class ReviewDataFacade
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