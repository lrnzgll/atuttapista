class RoutesController < ApplicationController
  layout "route"

  before_action :set_route, only: [:home, :data, :comments]
  before_action :adjust_visit_counter, only: [:home, :data, :comments]
  before_action :set_facade, only: [:home, :data, :comments]
  skip_before_action :authenticate_user!, only: [:home, :data, :comments]
    
  def home

  end

  def data
    
  end

  def comments
    
  end

  private

  def set_facade
    @content = Route::RouteFacade.new(@route)
  end

  def set_route
    @route ||= Route.find(params[:id])
  end

  def adjust_visit_counter
    @route.add_view
  end
end
