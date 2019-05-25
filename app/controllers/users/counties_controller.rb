class CountiesController < ApplicationController
  before_action :set_county, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def show
    
  end
  
  private

  def set_county
    @county ||= County.friendly.find(params[:id])
  end
end
