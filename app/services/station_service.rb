class StationService

  def self.find_nearest(address)
    # url = "/api/alt-fuel-stations/v1/nearest.json?location=#{address}&api_key=#{ENV['nrel_api_key']}"
    url = "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{address}&fuel_type=ELEC&limit=1&api_key=#{ENV['nrel_api_key']}"
    response = Faraday.get(url)
    data = JSON.parse(response.body, symbolize_names: true)
  end

end
