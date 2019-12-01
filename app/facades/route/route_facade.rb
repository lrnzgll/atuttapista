# frozen_string_literal: true

class Route::RouteFacade
  attr_reader :route
  def initialize(route)
    @route = route
  end  
end
