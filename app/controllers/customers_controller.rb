class CustomersController < ApplicationController
  def create
    respond_with Customer.create(params[:customer]), :status => :created
  end
end
