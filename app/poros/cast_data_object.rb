class CastDataObject
  attr_reader :real_name,
              :character_name

  def initialize(cast_member)
    @real_name = cast_member[:name]
    @character_name = cast_member[:character]
  end
end
