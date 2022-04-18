class DirectionService

  def self.get_directions(start, finish)
    url = "http://www.mapquestapi.com/directions/v2/route?key=#{ENV['mapquest_api_key']}&from=#{start}, CO&to=#{finish}"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
