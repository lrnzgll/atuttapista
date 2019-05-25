class RouteAddViewJob < ApplicationJob
  queue_as :routes

  def perform(route_id)
    View::ViewService.new(route_id).add_views
  end
end
