# frozen_string_literal: true

class Region::RegionFacade
  attr_reader :region
  def initialize(region)
    @region = region
  end

  def counties
    @counties ||= @region.counties.includes(county_routes: :route)
  end

  def favourite_routes
    @favourites_routes ||= @region.routes.includes(:kinds, :surfaces).order(cached_votes_total: :desc).load
  end

  # def new_routes
  #   @new_routes ||= @region.routes.order(created_at: :desc).limit(10).includes(:user).load
  # end
end
