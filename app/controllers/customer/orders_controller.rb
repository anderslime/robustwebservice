class Customer::OrdersController < CustomerController
  before_filter :authenticate_customer_with_token

  def index
    respond_with Order.where(customer_id: current_customer)
  end

  def create
    order = OrderService.new(order_params, current_customer).create
    respond_with order, :status => :created
  end

  private

  def order_params
    params.require(:order).
      permit(:date, :paymentinfo, { product_ids: [] })
  end
end
