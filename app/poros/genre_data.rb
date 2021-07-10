class GenreData
  def initialize
    @genre_data = APIService.connect(GENRE_PATH)
  end

  def format_genre
    @genre_data[:genres].each_with_object({}) do |genre, hash|
      hash[genre[:id]] = genre[:name]
    end
  end

  def genre_string(movie)
    formatted_genre = format_genre
    movie[:genre_ids].map do |genre_id|
      formatted_genre[genre_id]
    end
  end
end
