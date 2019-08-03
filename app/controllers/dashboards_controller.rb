# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :set_user, only: [:home]

  def home
    authorize @user, policy_class: DashboardPolicy
  end

  private

  def set_user
    @user = User.find(params[:id]) 
  end
  
end
