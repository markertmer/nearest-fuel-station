require 'rails_helper'

RSpec.describe 'Station Service', type: :service do

  it 'gets nearest station data' do
    station = StationService.find_nearest('1331 17th St, Denver, CO')

    info = station[:fuel_stations][0]
    address = [info[:street_address], info[:city], info[:state]].join(", ")

    expect(info[:station_name]).to eq("CBRE As Agent for EQC Operating Trust")
    expect(address).to eq("1225 17th Street, Suite 130, Denver, CO")
    expect(info[:fuel_type_code]).to eq("ELEC")
    expect(info[:access_days_time]).to eq("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
  end
end
