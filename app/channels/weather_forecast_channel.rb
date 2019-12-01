class WeatherForecastChannel < ApplicationCable::Channel
  def subscribed
    stream_from "WeatherForecastChannel:#{params[:request_id]}"
    LoadWeatherJob.perform_later(current_user.id, params[:request_id], params[:ip])
  end

  def unsubscribed
    stop_all_streams
  end
end
