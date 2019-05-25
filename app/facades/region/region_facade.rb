class Region::RegionFacade
  def initialize(region)
    @region = region
  end

  def counties
    @counties ||= County.where(region: @region).includes(:towns).order(name: :asc).group(:id).pluck(:name, :slug, Arel.sql('count(towns.id)'))
  end

  def favourite_routes
    @most_favourites_routes ||= @region.routes.order(cached_votes_total: :desc).limit(10).includes(:user).load
  end

  def new_routes
    @new_routes ||= @region.routes.order(created_at: :desc).limit(10).includes(:user).load
  end
end
