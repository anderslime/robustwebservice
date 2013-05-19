class Customer::OrdersController < CustomerController
  before_filter :authenticate_customer_with_token
  respond_to :json

  def index
    render :json => Order.where(customer_id: current_customer)
  end

  def create
    order = OrderService.new(order_params, current_customer).create
    if order.errors.empty?
      render :json => order, :status => :created
    else
      render :json => { :errors => order.errors.full_messages }, :status => :bad_request
    end
  end

  private

  def order_params
    params.require(:order).
      permit(:date, :paymentinfo, { product_ids: [] })
  end
end
