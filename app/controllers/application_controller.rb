class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :basic_authentication if Rails.env.production?

  helper_method :logged_in?

  private

  def basic_authentication
    authenticate_or_request_with_http_basic do |user, pass|
      user = Rails.application.secrets.basic_authentication_user &&
        pass == Rails.application.secrets.basic_authentication_password
    end
  end

  def logged_in?
    !!session[:member_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: t('omniauth.failure.unauthenticated')
  end
end
