class ReviewData
  def initialize(movie_id)
    @review_data = APIService.connect("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=")
  end

  def top_eight_reviews
    count = 0
    reviews = []
    10.times do
      cast << [@review_data[:cast][count][:name], @review_data[:cast][count][:character]]
      count += 1
    end
  end
end
