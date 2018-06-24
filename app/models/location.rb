class Location
  include Locator

  attr_accessor :city, :lat, :lng, :country, :timezone

  def initialize(city:, lat:, lng:, country:)
    begin
      @city = city
      @lat = lat
      @lng = lng
      @country = country
      @timezone = Timezone.lookup(lat, lng)
    rescue ActiveRecord::RecordNotFound => e
      print e
    end
  end

  def time
    @timezone.utc_to_local(Time.now)
  end
end
