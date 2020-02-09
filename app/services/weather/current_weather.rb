# frozen_string_literal: true

module Weather
  class CurrentWeather
    attr_reader :forecast

    def initialize(user_address)
      lng, lat = resolve_address(user_address)
      @forecast = ForecastIO.forecast(lat, lng, params: { units: 'si', exclude: 'flags,minutely,hourly,alert' })
    end

    def week_weather
      @forecast.daily.data[2..]
    end

    def time
      Time.at(@forecast.currently[:time])
    end

    def summary
      @forecast.currently[:summary]
    end

    def icon
      @forecast.currently[:icon]
    end

    def precip_probability
      @forecast.currently[:precipProbability]
    end

    def temperature
      @forecast.currently[:temperature]
    end

    def apparent_temperature
      @forecast.currently[:apparentTemperature]
    end

    def humidity
      @forecast.currently[:humidity].to_f * 100
    end

    def pressure
      @forecast.currently[:pressure]
    end

    def uv_index
      @forecast.currently[:uv_index]
    end

    private

    def resolve_address(user_address)
      return user_address.lonlat.lon, user_address.lonlat.lat if user_address.lonlat

      hash = Geocoder.search(user_address.ip).first
      return hash.data['lon'], hash.data['lat']
    end
  end
end
