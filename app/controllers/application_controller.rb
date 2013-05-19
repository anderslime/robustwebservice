class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found_render
  rescue_from ActiveModel::MassAssignmentSecurity::Error, :with => :attribute_protection_error

  def record_not_found_render(exception)
    render :json => { :error => "Record not found!" }, :status => :not_found
  end

  def attribute_protection_error(exception)
    render :json => { :error => "Invalid request or lack of authorization" }, :status => :bad_request
  end

  def render_unauthorized_customer!
    render :json => { :error => "Unauthorized customer!"}, :status => :unauthorized
  end

  def authenticate_customer_with_http_basic
    authenticate_with_http_basic do |email, password|
      @current_customer = Customer.find_by_email(email).authenticate(password)
    end || render_unauthorized_customer!
  end

  def authenticate_customer_with_token
    authenticate_with_http_token do |token, options|
      login_with_token(token)
    end || render_unauthorized_customer!
  end

  def login_with_token token
    session = CustomerSession.find_by_access_token(token)
    if session
      @current_customer = session.customer
    end
    session
  end

  def current_customer
    @current_customer
  end
  helper_method :current_customer
end
