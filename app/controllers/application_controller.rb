# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  breadcrumb 'Home', :root_path
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_user_cookie
  after_action :verify_authorized, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_user_cookie
    cookies.signed[:user_id] = current_user.id if current_user
  end

  def configure_permitted_parameters
    attributes = [:username]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path(resource_or_scope)
  end

  def user_not_authorized
    flash[:alert] = "Non sei autorizzato a compiere questa azione"
    redirect_to root_path
  end
end
