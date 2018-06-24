require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'based on city name' do
    location = Location.find_by_ip(nil)

    expect(location.city).to_not be_nil
  end

  it 'based on place ID' do
    location = Location.find_by_place_id('ChIJAVkDPzdOqEcRcDteW0YgIQQ')

    expect(location.city).to eq('Berlin')
    expect(location.country).to eq('Germany')
  end
end
