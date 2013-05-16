class ProductsController < ApplicationController
  def index
    render :json => Product.all
  end

  def show
    render :json => Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update_attributes(params[:product])
    render :json => product, :status => :ok
  end

  def destroy
    Product.find(params[:id]).destroy
    render :nothing => true, :status => :ok
  end

  def create
    product = Product.new(params[:product])

    if product.save
      render :json => product
    else
      render :json => { :errors => product.errors.full_messages }
    end
  end
end
