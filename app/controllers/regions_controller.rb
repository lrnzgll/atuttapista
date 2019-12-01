# frozen_string_literal: true

class RegionsController < ApplicationController
  before_action :set_region, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]
  after_action :skip_authorization, only: [:show]

  def show
    @content = Region::RegionFacade.new(@region)
  end

  private

  def set_region
    @region ||= Region.find(params[:id])
  end
end
