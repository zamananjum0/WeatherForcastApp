module Locator
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_ip(ip)
      unless Rails.env.production?
        ip = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
      end
      geolocation = Geokit::Geocoders::MultiGeocoder.geocode ip
      Location.new(city: geolocation.city, lat: geolocation.lat, lng: geolocation.lng, country: geolocation.country)
    end

    def find_by_place_id(place_id)
      client = GooglePlaces::Client.new(Rails.application.secrets.google_api_key)
      spot = client.spot(place_id)
      Location.new(city: spot.city, lat: spot.lat, lng: spot.lng, country: spot.country)
    end
  end
end
