require 'rails_helper'

RSpec.feature 'Weather checking', type: :feature do
  scenario 'based on IP location' do
    visit '/'

    location = Location.find_by_ip(nil)

    expect(page).to have_text(location.city)
  end
end
