module Weather
  attr_reader :lat, :lng, :location

  def initialize(lat,lng, location = nil)
    @lat = lat
    @lng = lng
    @forecast ||= ForecastIO.forecast(@lat,@lng, params:{ exclude: 'flags,minutely,hourly,alert'})
    @location = location
  end
end
