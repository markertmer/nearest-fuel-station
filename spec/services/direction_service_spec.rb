require 'rails_helper'

RSpec.describe 'get directions to charging station', type: :service do

  it 'gets directions, distance and travel time' do
    directions = DirectionService.get_directions('1331 17th St, Denver, CO', '1225 17th Street, Suite 130, Denver, CO')

    binding.pry
  end
end
