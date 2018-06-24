class WeathersController < ApplicationController
  def index
    begin
      @location = if params[:place_id]
                    Location.find_by_place_id(params[:place_id])
                  else
                    Location.find_by_ip(request.remote_ip)
                  end

      @weather = Weather.find_by_location(lat: @location.lat, lng: @location.lng)
    rescue ActiveRecord::RecordNotFound => e
      print e
    end
  end

  private

  def weather_params
    params.permit(:place_id)
  end
end