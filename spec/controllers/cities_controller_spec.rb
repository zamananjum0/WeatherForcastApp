require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe 'when a user seaches for a city' do
    it 'is a valid city' do
      post :search, params: { name: 'Berlin' }

      expect(response).to be_success
      expect(response.content_type).to eq 'application/json'
      expect(JSON.parse(response.body)).to include('text' => 'Berlin, Germany', 'id' => 'ChIJAVkDPzdOqEcRcDteW0YgIQQ')
    end

    it 'is a invalid city' do
      post :search, params: { name: 'Unknown City' }

      expect(response).to be_success
      expect(response.content_type).to eq 'application/json'
      expect(JSON.parse(response.body)).to be_empty
    end
  end
end
