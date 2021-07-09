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

# def search
#   response = Faraday.get(http:/api link) do |req|
#     req.headers['X-API_KEY'] = ENV['PROPUBLICA_API_KEY']
#   end
#   json = JSON.parse(response.body, symbolize_names: true)
# end
