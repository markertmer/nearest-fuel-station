require 'rails_helper'

RSpec.describe 'Station Facade', type: :facade do

  it 'returns an object with attributes' do
    station = StationFacade.get_info('1331 17th St, Denver, CO')

    expect(station.name).to eq("CBRE As Agent for EQC Operating Trust")
    expect(station.distance).to eq(0.1)
    expect(station.travel_time).to eq(1)
    expect(station.address).to eq("1225 17th Street, Suite 130, Denver, CO")
    expect(station.directions).to eq("Start out going southeast on 17th St toward Larimer St/CO-33. 1225 17TH ST, SUITE 130 is on the right.")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
  end
end
