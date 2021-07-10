class ReviewData
  def initialize(movie_id)
    @review_data = APIService.connect("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=")
  end

  def top_eight_reviews
    count = 0
    reviews = []
    if @review_data[:results].count < 8
      times_to_loop = @review_data[:results].count
    else
      times_to_loop = 8
    end
    times_to_loop.times do
      reviews << [@review_data[:results][count][:author], @review_data[:results][count][:content]]
      count += 1
    end
    require "pry"; binding.pry
  end
end
