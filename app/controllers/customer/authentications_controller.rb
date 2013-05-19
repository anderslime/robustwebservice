class Customer::AuthenticationsController < CustomerController
  before_filter :authenticate_customer_with_http_basic

  def create
    session = CustomerSession.create(customer_session_params)
    respond_with session, :status => :created
  end

  def customer_session_params
    {
      :customer => current_customer
    }
  end
end
