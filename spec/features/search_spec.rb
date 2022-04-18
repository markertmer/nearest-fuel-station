require 'rails_helper'

RSpec.describe 'search for nearest charging station', type: :feature do

  it 'uses the search bar to get the closest station' do
    visit '/'
    select "Turing", :from => "location"
    click_on("Find Nearest Station")

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Here's Your Nearest Charging Station")
    expect(page).to have_content("Name:")
    expect(page).to have_content("miles away") #
    expect(page).to have_content("Travel Time:") #
    expect(page).to have_content("Address:")
    expect(page).to have_content("Directions:") #
    expect(page).to have_content("Fuel Type:")
    expect(page).to have_content("Access Times:")
  end
end
