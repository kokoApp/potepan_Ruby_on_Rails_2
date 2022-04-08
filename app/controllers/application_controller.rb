class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :search

  def search
    @q = Reserve.ransack(params[:q])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image, :profile])
  end

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

end
