# frozen_string_literal: true

class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search]
  after_action :skip_authorization, only: %i[home search]

  def home
    @content = Home::HomeFacade.new
  end

  def search
    routes = Route.search(params[:search]).records
    @content = Home::SearchFacade.new(routes)
  end
end
