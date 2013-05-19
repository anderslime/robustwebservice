class Customer::OrdersController < CustomerController
  before_filter :authenticate_customer_with_token

  def show
    respond_with Order.find(params[:id])
  end

  def index
    respond_with Order.where(customer_id: current_customer)
  end

  def create
    order = OrderService.new(order_params, current_customer).create
    respond_with order, :status => :created
  end

  def destroy
    Order.find(params[:id]).destroy
    render :nothing => true, :status => :ok
  end

  private

  def order_params
    params.require(:order).
      permit(:date, :paymentinfo, { product_ids: [] })
  end
end
