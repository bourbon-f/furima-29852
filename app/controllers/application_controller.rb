class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'aaa' && password == '1234'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :pass_word, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
