class ApplicationController < ActionController::Base
  protect_from_forgery

  self.responder = JsonApiResponder
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found_render
  rescue_from ActiveModel::MassAssignmentSecurity::Error, :with => :attribute_protection_error
  rescue_from OrderService::ProductNotFound, :with => :product_not_found

  def record_not_found_render(exception)
    render :json => { :error => "Record not found!" }, :status => :not_found
  end

  def attribute_protection_error(exception)
    render :json => { :error => "Invalid request or lack of authorization" }, :status => :bad_request
  end

  def product_not_found(exception)
    render :json => { :error => exception.message }, :status => :not_found
  end
end
