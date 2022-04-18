require 'rails_helper'

RSpec.describe 'Station Object', type: :poro do

  it 'builds an object with station attributes' do
    station_data = StationService.find_nearest('1331 17th St, Denver, CO')
    info = station_data[:fuel_stations][0]
    station = StationObject.new(info)

    expect(station.name).to eq("CBRE As Agent for EQC Operating Trust")
    expect(station.address).to eq("1225 17th Street, Suite 130, Denver, CO")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
  end

  it 'adds directions to the object' do
    address = '1331 17th St, Denver, CO'
    station_data = StationService.find_nearest(address)
    info = station_data[:fuel_stations][0]
    station = StationObject.new(info)

    trip_data = DirectionService.get_directions(address, station.address)
    info = trip_data[:route][:legs]
    station.add_trip(info)

    expect(station.distance).to eq(0.1)
    expect(station.travel_time).to eq(1)
    expect(station.directions).to eq("Start out going southeast on 17th St toward Larimer St/CO-33. 1225 17TH ST, SUITE 130 is on the right.")
  end
end
