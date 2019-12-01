# frozen_string_literal: true

class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]
  after_action :skip_authorization, only: [:home, :search]
  
  def home
    @content ||= Home::HomeFacade.new
  end

  def search
    @query = params[:search]
  end
end
