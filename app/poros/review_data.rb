class ReviewData
  def initialize(movie_id)
    review_data = APIService.connect("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=")
    @reviews = review_data[:results]
  end

  def top_eight_reviews
    count = 0
    reviews = []
    times_to_loop = determine_times_to_loop
    times_to_loop.times do
      reviews << [@reviews[count][:author], @reviews[count][:content]]
      count += 1
    end
    reviews
  end

  def determine_times_to_loop
    if @reviews.count < 8
      @reviews.count
    else
      8
    end
  end
end
