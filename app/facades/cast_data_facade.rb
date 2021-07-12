class CastDataFacade
  def self.get_full_cast(movie_id)
    APIService.connect("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=")[:cast]
  end

  def self.get_cast_objects(movie_id)
    full_cast = self.get_full_cast(movie_id)
    full_cast.map do |cast_member|
      CastDataObject.new(cast_member)
    end
  end

  def self.limited_cast(movie_id)
    full_cast = self.get_cast_objects(movie_id)
    limited_cast_count = self.limited_cast_count(full_cast.count)

    full_cast.first(limited_cast_count)
  end

  private

  def self.limited_cast_count(full_cast_count)
    if full_cast_count < 10
      full_cast_count
    else
      10
    end
  end
end
