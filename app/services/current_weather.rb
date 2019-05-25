class CurrentWeather
  include Weather
  
  def initialize(lat,lng, location = nil)
    super(lat,lng, location = nil)
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
