class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found_render
  # rescue_from ActiveModel::MassAssignmentSecurity::Error, :with => :attribute_protection_error

  def record_not_found_render(exception)
    render :json => { :error => "Record not found!" }, :status => :not_found
  end

  def attribute_protection_error(exception)
    render :json => { :error => "Invalid request or lack of authorization" }, :status => :bad_request
  end

  def render_unauthorized_customer!
    render :json => { :error => "Unauthorized customer!"}, :status => :unauthorized
  end
end
