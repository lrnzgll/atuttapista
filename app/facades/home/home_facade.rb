class Home::HomeFacade
  def initialize   
  end

  def selected_regions
    @selected_regions ||= Region.left_joins(:routes).group(:id).order(Arel.sql'COUNT(routes.id) DESC').limit(4).pluck_all(:name, :id)
  end
  def featured_routes
    @featured_routes ||= Route.order(cached_votes_total: :desc).limit(6).includes(:user).pluck_all(:name, :id, :user_id, :username)
  end
  def routes_by_region
    @routes_by_region ||= Region.order(name: :asc).pluck_all(:name, :id, :slug)
  end
end
