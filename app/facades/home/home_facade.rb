class Home::HomeFacade
  def initialize   
  end

  def new_routes
    @new_routes ||= Route.order(created_at: :desc).limit(10).includes(:user).load
  end

  def selected_regions
    @selected_regions ||= Region.left_joins(:routes).group(:id).order('COUNT(routes.id) DESC').limit(4).load
  end
  def most_favourites_routes
    @most_favourites_routes ||= Route.order(cached_votes_total: :desc).limit(10).includes(:user).load
  end
  def routes_by_region
    @routes_by_region ||= Region.order(name: :asc).pluck(:name, :slug)
  end
  def data_regions_routes
    @data_regions_routes ||= Region.includes(:routes).order(name: :asc).group(:id).pluck(:name, Arel.sql('count(routes.id)')).map { |r,c| { region: r, count: c } }
  end
end
