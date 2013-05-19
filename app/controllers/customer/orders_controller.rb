class Customer::OrdersController < CustomerController
  before_filter :authenticate_customer_with_token
  respond_to :json

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
      permit(:date, :payment_info, { product_ids: [] })
  end
end
