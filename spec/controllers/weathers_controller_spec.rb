require 'rails_helper'

RSpec.describe WeathersController, type: :controller do
  describe 'GET index' do
    it 'renders the index page' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'POST /cities/search' do
    it 'shows weather information' do
      post :index, params: { place_id: 'ChIJAVkDPzdOqEcRcDteW0YgIQQ' }

      expect(response).to render_template('index')
    end
  end
end
