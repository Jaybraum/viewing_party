class APIService
  def self.grab_movie_details_json(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=" + ENV['API_KEY'])
    validate_connection(response)
  end

  def self.movie_search_json(title)
    response1 = Faraday.get("#{SEARCH_PATH}#{ENV['API_KEY']}&query=#{title}&page=1")
    response2 = Faraday.get("#{SEARCH_PATH}#{ENV['API_KEY']}&query=#{title}&page=2")
    response1 = validate_connection(response1)
    response2 = validate_connection(response2)
    { first: response1[:results], second: response2[:results] }
  end

  def self.grab_movies_json(page_num)
    response = Faraday.get(DISCOVER_PATH + ENV['API_KEY'] + "&page=#{page_num}")
    validate_connection(response)
  end

  def self.grab_top_rated_json
    response1 = Faraday.get("#{TOP_PATH}#{ENV['API_KEY']}&page=1")
    response2 = Faraday.get("#{TOP_PATH}#{ENV['API_KEY']}&page=2")
    response1 = validate_connection(response1)
    response2 = validate_connection(response2)
    { first: response1[:results], second: response2[:results] }
  end

  def self.grab_cast_json(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=" + ENV['API_KEY'])
    validate_connection(response)
  end

  def self.grab_genres_json
    response = Faraday.get(GENRE_PATH + ENV['API_KEY'])
    validate_connection(response)
  end

  def self.grab_reviews_json(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=" + ENV['API_KEY'])
    validate_connection(response)
  end

  def self.validate_connection(response)
    if !response.status == 200
      nil
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
