class CustomersController < ApplicationController
  def create
    customer = Customer.new(params[:customer])

    if customer.save
      render :json => customer
    else
      render :json => { :errors => customer.errors.full_messages }
    end
  end
end
