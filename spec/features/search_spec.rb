require 'rails_helper'

RSpec.describe 'search for nearest charging station', type: :feature do

  it 'uses the search bar to get the closest station' do
    visit '/'
    select "Turing", :from => "location"
    click_on("Find Nearest Station")

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Here's Your Nearest Charging Station")
    expect(page).to have_content("Name: CBRE As Agent for EQC Operating Trust")
    expect(page).to have_content("0.1 miles away") #
    expect(page).to have_content("Travel Time: 1 minutes") #
    expect(page).to have_content("Address: 1225 17th Street, Suite 130, Denver, CO")
    expect(page).to have_content("Directions: Start out going southeast on 17th St toward Larimer St/CO-33. 1225 17TH ST, SUITE 130 is on the right.") #
    expect(page).to have_content("Fuel Type: ELEC")
    expect(page).to have_content("Access Times: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
  end
end
