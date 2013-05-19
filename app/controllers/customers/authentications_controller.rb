class Customers::AuthenticationsController < ApplicationController
  before_filter :authenticate_customer_with_http_basic

  def create
    session = CustomerSession.create(customer_session_params)
    render :json => session, status: :created
  end

  def customer_session_params
    {
      :customer => current_customer
    }
  end
end
