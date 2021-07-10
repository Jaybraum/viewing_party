class CastData
  def initialize(movie_id)
    @cast_data = APIService.connect("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=")
  end

  def top_ten_cast
    count = 0
    cast = []
    10.times do
      cast << [@cast_data[:cast][count][:name], @cast_data[:cast][count][:character]]
      count += 1
    end
  end
end
