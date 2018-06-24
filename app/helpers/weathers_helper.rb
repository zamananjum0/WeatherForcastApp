require 'open_weather_map'

module WeathersHelper
  MEASURE_ICONS = {
    humidity: 'humidity',
    pressure: 'barometer',
    wind_speed: 'small-craft-advisory'
  }.freeze

  METRIC = {
    humidity: '%',
    pressure: ' hPa',
    wind_speed: ' m/s'
  }.freeze

  def location_name(location)
    name = location.city
    name += ", #{location.country}" if location.country
    name
  end

  def current_time(location)
    "<i class=\"wi wi-time-3\"></i> #{location.time.strftime('%I:%M %p')} UTC | #{location.time.strftime('%A').upcase} #{location.time.strftime('%b %d, %Y')}".html_safe
  end

  def current_temperature(weather, location)
    "<i class=\"wi #{weather_icon(weather.id, location.time)}\"></i> #{weather.temp.to_i} <i class=\"wi wi-celsius\"></i>".html_safe
  end

  def weather_icon(id, time)
    icon = 'wi-'
    icon += time.hour < 18 ? 'day-' : 'night-'
    icon += if id == 800
              time.hour < 18 ? 'sunny' : 'clear'
            else
              OpenWeatherMap::ICON[id]
            end
    icon
  end

  def temperature(type, temp)
    icon = if type == :max
             '<i class=\'wi wi-thermometer\'></i>'
           else
             '<i class=\'wi wi-thermometer-exterior\'></i>'
           end
    "#{icon} #{temp} <i class='wi wi-celsius'></i>".html_safe
  end

  def weather_description(weather)
    weather.description
  end

  def weather_condition(weather, condition)
    "<i class=\"wi wi-#{MEASURE_ICONS[condition]}\"></i>  #{weather.send(condition).to_i}#{METRIC[condition]}".html_safe
  end

  def wind_direction(weather)
    "<i class=\"wi wi-wind towards-#{weather.wind_direction}-deg\"></i>  #{weather.wind_direction.to_i}°".html_safe
  end
end
