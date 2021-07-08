# require './config/application.yml'

class APIService
  def self.connect(path)
    begin
      validate_connection(Faraday.get(path + ENV['API_KEY']))
    end
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
