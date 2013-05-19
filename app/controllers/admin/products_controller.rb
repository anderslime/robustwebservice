class Admin::ProductsController < AdministratorController
  before_filter :authenticate_administrator_with_token

  def index
    respond_with Product.all
  end

  def show
    respond_with Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update_attributes(params[:product])
    respond_with product
  end

  def destroy
    Product.find(params[:id]).destroy
    render :nothing => true, :status => :ok
  end

  def create
    respond_with Product.create(params[:product])
  end
end
