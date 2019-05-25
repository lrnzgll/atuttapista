module View
  class ViewService
    def initialize(route_id)
      @route = Route.find(route_id)
    end

    def add_views
      @route.with_lock do
        @route.views_counter += 1
        @route.save
      end
    end
  end
end
