# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery
  before_action :authenticate_user! 

  private

  def configure_permitted_parameters
    attributes = [:username]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
