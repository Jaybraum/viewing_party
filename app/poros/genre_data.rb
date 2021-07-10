class GenreData
  def initialize
    @genre_data = APIService.connect(GENRE_PATH)
  end

  def format_genres
    @genre_data[:genres].each_with_object({}) do |genre, hash|
      hash[genre[:id]] = genre[:name]
    end
  end

  def movie_genres(movie)
    formatted_genres = format_genres
    movie[:genre_ids].map do |genre_id|
      formatted_genres[genre_id]
    end
  end
end
