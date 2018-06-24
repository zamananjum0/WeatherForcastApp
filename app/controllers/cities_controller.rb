class CitiesController < ApplicationController
  def search
    begin
      client = GooglePlaces::Client.new(Rails.application.secrets.google_api_key)
      predictions = client.predictions_by_input(
          params[:name],
          types: '(cities)'
      )

      cities = []
      predictions.each do |prediction|
        cities << {text: prediction.description, id: prediction.place_id}
      end

      render json: cities
    rescue ActiveRecord::RecordNotFound => e
      print e
    end
  end
end
