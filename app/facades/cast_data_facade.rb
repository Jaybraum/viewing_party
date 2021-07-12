class CastDataFacade
  def self.get_all_cast_members(movie_id)
    APIService.connect("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=")
  end

  def self.get_cast_objects(movie_id)
    full_cast = self.get_all_cast_members(movie_id)
    require 'pry'; binding.pry
    full_cast[:cast].map do |cast_member|
      CastData.new(cast_member)
    end
  end

  def self.limited_cast(movie_id)
    full_cast = self.get_cast_objects(movie_id)
    times_to_loop = determine_times_to_loop

    count = 0
    limited_cast = []

    times_to_loop.times do
      limited_cast << full_cast[count]
      count += 1
    end

    limited_cast
  end

  private

  def determine_times_to_loop
    full_cast = self.get_all_cast_members
    if full_cast.count < 10
      full_cast.count
    else
      10
    end
  end
end
