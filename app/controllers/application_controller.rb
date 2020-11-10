class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :request, :self_introduction, :sex, :image, :team_id, :prefecture_id])

    devise_parameter_sanitizer.permit(:account_update, keys:[:nickname, :birthday, :request, :self_introduction, :sex, :imame, :team_id, :prefecture_id])
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
end