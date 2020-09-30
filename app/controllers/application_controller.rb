class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_htpp_basic do |username, password|
      username == 'aaa' && password == '1234'
    end
  end
end
