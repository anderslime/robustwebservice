class Admin::CustomersController < AdministratorController
  before_filter :authenticate_administrator_with_token

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update_attributes(params[:customer])
    respond_with customer
  end

  def destroy
    Customer.find(params[:id]).destroy
    render :nothing => true, :status => :ok
  end

  def create
    respond_with Customer.create(params[:customer])
  end
end
