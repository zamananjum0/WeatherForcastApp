class Weather
  include WeatherAPI

  attr_accessor :id, :main, :description, :temp, :temp_min, :temp_max, :humidity, :pressure, :wind_speed, :wind_direction
end
