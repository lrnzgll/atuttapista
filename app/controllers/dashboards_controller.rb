# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :set_user, only: [:home]
  before_action :set_request, :set_ip
  breadcrumb 'Dashboard', [:dashboard, @user]

  def home
    authorize @user, policy_class: DashboardPolicy
    @content = Dashboard::DashboardFacade.new(@user, @ip)
  end

  private

  def set_user
    @user = current_user
  end

  def set_request
    @request_id = request.uuid
  end

  def set_ip
    @ip = '89.36.69.135'
  end
end
