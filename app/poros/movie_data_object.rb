require './config/initializers/constants'

class MovieDataObject
  attr_reader :cast
  
  def initialize(cast_member)

    @cast = MovieDataFacade.get_limited_cast(movie)
    @character_name = cast_member[:character]
  end
end
