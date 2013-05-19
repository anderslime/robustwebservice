class AdministratorController < ApplicationController
  def authenticate_administrator_with_http_basic
    authenticate_with_http_basic do |email, password|
      @current_admin = Administrator.find_by_email(email).authenticate(password)
    end || render_unauthorized_admin!
  end

  def authenticate_administrator_with_token
    authenticate_with_http_token do |token, options|
      login_with_token(token)
    end || render_unauthorized_admin!
  end

  def login_with_token token
    session = AdministratorSession.find_by_access_token(token)
    if session
      @current_admin = session.administrator
    end
    session
  end

  def current_admin
    @current_admin
  end
  helper_method :current_admin

  def render_unauthorized_admin!
    render :json => { :error => "Unauthorized admin!"}, :status => :unauthorized
  end
end
