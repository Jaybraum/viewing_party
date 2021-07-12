class CastDataFacade
  def self.get_cast_objects(movie_id)
    cast = APIService.get_cast_json(movie_id)[:cast]
    cast.map do |cast_member|
      CastDataObject.new(cast_member)
    end
  end

  def self.limited_cast(movie_id)
    self.get_cast_objects(movie_id)[0..9]
  end
end
