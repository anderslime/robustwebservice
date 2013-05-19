class Admin::CustomersController < ApplicationController
  def index
    render :json => Customer.all
  end

  def show
    render :json => Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update_attributes(params[:customer])
    render :json => customer, :status => :ok
  end

  def destroy
    Customer.find(params[:id]).destroy
    render :nothing => true, :status => :ok
  end

  def create
    customer = Customer.new(params[:customer])

    if customer.save
      render :json => customer
    else
      render :json => { :errors => customer.errors.full_messages }
    end
  end
end
