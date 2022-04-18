class StationFacade

  def self.get_info(address)
    station_data = StationService.find_nearest(address)
    info = station_data[:fuel_stations][0]
    station = StationObject.new(info)

    trip_data = DirectionService.get_directions(address, station.address)
    info = trip_data[:route][:legs]
    station.add_trip(info)
    station
  end
end
