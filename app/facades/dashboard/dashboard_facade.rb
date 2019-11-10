class Dashboard::DashboardFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def routes_count
    @routes_count ||= @user.routes.count
  end

  def region_routes_count
    @region_routes_count ||= first_address.region.routes.count
  end

  def user_coordinates 
    @user_coordinates ||= { lng: first_address.lonlat.lon, lat: first_address.lonlat.lat }
  end

  private

  def first_address
    @first_address ||= @user.addresses.first
  end
  
end 