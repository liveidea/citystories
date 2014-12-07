class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  before_filter :configure_permitted_parameters, if: :devise_controller?

  
  def after_sign_in_path_for (resource)
    profile_path 
  end
  
  def after_sign_up_path_for (resource)
    profile_path 
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :nickname
  end


end
