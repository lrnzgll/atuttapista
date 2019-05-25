class RegionsController < ApplicationController
  before_action :set_region, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @content = Region::RegionFacade.new(@region)
  end

  private

  def set_region
    @region ||= Region.friendly.find(params[:id])
  end
end
