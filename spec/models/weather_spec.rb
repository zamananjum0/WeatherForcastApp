require 'rails_helper'

RSpec.describe Weather, type: :model do
  it 'fetches based on location' do
    location = Location.find_by_place_id('ChIJAVkDPzdOqEcRcDteW0YgIQQ')

    weather = Weather.find_by_location(lat: location.lat, lng: location.lng)

    expect(weather).to_not be_nil
    expect(weather.id).to be > 0
  end
end
