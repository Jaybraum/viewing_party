class APIService

  def self.get_cast_json(movie_id)
    response = Faraday.get("https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=" + ENV['API_KEY'])
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
