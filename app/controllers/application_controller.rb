class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #  デバイスのコントローラーが呼ばれたときに以下のメゾットが呼ばれる

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :first_name, :family_name, :first_furigana, :family_furigana, :birth])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:email,:password])
  end
end
