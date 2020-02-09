# frozen_string_literal: true

class RoutesController < ApplicationController
  before_action :set_route, only: [:show]
  before_action :set_first_region, only: [:show]
  before_action :adjust_visit_counter, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    breadcrumb @first_region.name, region_path(@first_region.id)
    breadcrumb @route.name, [@route]
    @content = Route::RouteFacade.new(@route)
    authorize @content, policy_class: RoutePolicy
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def set_first_region
    @first_region = @route.regions.first
  end

  def adjust_visit_counter
    @route.add_view
  end
end
