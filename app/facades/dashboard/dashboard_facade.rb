class Dashboard::DashboardFacade
  attr_reader :user

  def initialize(user, ip)
    @user = user
    @ip = ip
  end

  def routes_count
    @routes_count ||= @user.routes.count
  end

  def region_routes_count
    # @region_routes_count ||= user_address.region.routes.count
  end

  def user_coordinates
    @user_coordinates ||= (user.user_coordinates || Geocoder.user_coordinates(@ip))
  end
end
