# frozen_string_literal: true

class Home::HomeFacade
  def initialize   
  end

  def selected_regions
    @selected_regions ||= Region.left_joins(:routes).group(:id).order(Arel.sql'COUNT(routes.id) DESC').limit(4).pluck_all(:name, :id)
  end

  def weather
    @weather ||= Weather::CurrentWeather.new('43', '55')
  end

  def featured_routes
    @featured_routes ||= Route.includes(:user, :kinds).order(cached_votes_total: :desc).limit(9)
  end

  def routes_by_region
    @routes_by_region ||= Region.order(name: :asc).pluck_all(:name, :id, :slug)
  end
end
