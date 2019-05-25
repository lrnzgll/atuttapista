class Route::RouteFacade
  
  def initialize(route)
    @route = route
  end

  def name
    @route.name
  end

  def description
    @route.description
  end
  
end
