class CustomerController < ApplicationController
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

  def render_unauthorized_customer!
    render :json => { :error => "Unauthorized customer!"}, :status => :unauthorized
  end
end
