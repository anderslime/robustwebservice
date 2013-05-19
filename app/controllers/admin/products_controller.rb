class Admin::ProductsController < AdminController
  before_filter :authenticate_administrator_with_token

  def index
    render :json => Product.all
  end

  def show
    render :json => Product.find(params[:id])
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
