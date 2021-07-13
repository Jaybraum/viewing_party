class APIService

  def self.get_movie_details_json(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=" + ENV['API_KEY'])
    self.validate_connection(response)
  end

  def self.get_movies_json(page_num)
    response = Faraday.get(DISCOVER_PATH + ENV['API_KEY'] + "&page=#{page_num}")
    self.validate_connection(response)
  end

  def self.get_top_rated_json
    response1 = Faraday.get(TOP_PATH + ENV['API_KEY'] + "&page=1")
    response2 = Faraday.get(TOP_PATH + ENV['API_KEY'] + "&page=2")
    response1 = self.validate_connection(response1)
    response2 = self.validate_connection(response2)
    {:first => response1[:results], :second => response2[:results]}
  end

  def self.get_cast_json(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=" + ENV['API_KEY'])
    self.validate_connection(response)
  end

  def self.get_genres_json
    response = Faraday.get(GENRE_PATH + ENV['API_KEY'])
    self.validate_connection(response)
  end

  def self.get_reviews_json(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=" + ENV['API_KEY'])
    self.validate_connection(response)
  end

  def self.validate_connection(response)
    if !response.status == 200
      puts "Connection to API Interrupted"
      nil
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
