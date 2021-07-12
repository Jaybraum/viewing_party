class GenreDataObject
  attr_reader :id,
              :name

  def initialize(genre)
    @id = genre[:id]
    @name = genre[:name]
  end
end
