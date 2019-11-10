# frozen_string_literal: true

class HomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :search]
  after_action :skip_authorization, only: [:home]
  
  def home
    @content ||= Home::HomeFacade.new
    @search = nil
  end
end
