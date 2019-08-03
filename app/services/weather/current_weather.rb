# frozen_string_literal: true
module Weather
  class CurrentWeather    
    def initialize(lat, lng)
      @lat = lat
      @lng = lng
      @forecast = ForecastIO.forecast(lat,lng, params:{ exclude: 'flags,minutely,hourly,alert'})
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
  end
end
