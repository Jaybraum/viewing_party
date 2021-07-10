class CastData
  def initialize(movie_id)
    cast_data = APIService.connect("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=")
    @cast = cast_data[:cast]
  end

  def top_ten_cast
    times_to_loop = determine_times_to_loop
    count = 0
    cast = []

    times_to_loop.times do
      cast << [@cast[count][:name], @cast[count][:character]]
      count += 1
    end

    cast
  end

  private

  def determine_times_to_loop
    if @cast.count < 8
      @cast.count
    else
      10
    end
  end
end
