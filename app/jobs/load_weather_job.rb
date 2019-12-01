class LoadWeatherJob < ApplicationJob
  queue_as :default
  Addressobj = Struct.new(:lonlat, :ip)

  def perform(user_id, request_id, ip)
    user = User.includes(:address).find(user_id)
    user_address = Addressobj.new(user.address&.lonlat, ip)
    weather = Weather::CurrentWeather.new(user_address) 

    ActionCable.server.broadcast "WeatherForecastChannel:#{request_id}", {
      weather: WeatherForecastController.render( partial: 'dashboards/partials/current_forecast', locals: {forecast: weather}).squish
    }
  end
end
