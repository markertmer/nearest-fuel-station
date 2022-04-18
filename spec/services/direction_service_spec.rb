require 'rails_helper'

RSpec.describe 'Direction Service', type: :service do

  it 'gets directions, distance and travel time' do
    trip = DirectionService.get_directions('1331 17th St, Denver, CO', '1225 17th Street, Suite 130, Denver, CO')

    distance = trip[:route][:legs].sum do |leg|
      leg[:maneuvers].sum do |maneuver|
        maneuver[:distance]
      end
    end.round(1)

    travel_time = (trip[:route][:legs].sum do |leg|
      leg[:maneuvers].sum do |maneuver|
        maneuver[:time]
      end
    end.to_f / 60).ceil

    directions = trip[:route][:legs].map do |leg|
      leg[:maneuvers].map do |maneuver|
        maneuver[:narrative]
      end
    end.flatten.join(" ")

    expect(distance).to eq(0.1)
    expect(travel_time).to eq(1)
    expect(directions).to eq("Start out going southeast on 17th St toward Larimer St/CO-33. 1225 17TH ST, SUITE 130 is on the right.")
  end
end
