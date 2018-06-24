require 'rest-client'

module WeatherAPI
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_location(lat:, lng:)
      key = Rails.application.secrets.open_weather_map_api_key
      response = RestClient.get("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}&APPID=#{key}&units=metric")
      build(JSON.parse(response.body))
    end

    def build(params)
      weather = Weather.new
      weather.id = params['weather'][0]['id']
      weather.main = params['weather'][0]['main']
      weather.description = params['weather'][0]['description']
      weather.temp = params['main']['temp']
      weather.temp_min = params['main']['temp_min']
      weather.temp_max = params['main']['temp_max']
      weather.pressure = params['main']['pressure']
      weather.humidity = params['main']['humidity']
      weather.wind_speed = params['wind']['speed']
      weather.wind_direction = params['wind']['deg']
      weather
    end
  end
end
