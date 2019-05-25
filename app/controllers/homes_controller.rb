class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact]

  def home
    @content ||= Home::HomeFacade.new
  end

  def contact
  end

  def search
    @search_content ||= Home::SearchFacade.new
  end
end
