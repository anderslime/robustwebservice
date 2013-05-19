# This repsponder overwrites the default behaviour from ActionController:Responder
# https://github.com/rails/rails/blob/master/actionpack/lib/action_controller/metal/responder.rb
class JsonApiResponder < ActionController::Responder
  protected

  def api_behavior(error)
    if post?
      display resource, :status => :created
    elsif put?
      display resource, :status => :ok
    else
      super
    end
  end

  # Overwrites status message on error from unprocessable_entity to bad_request
  def display_errors
    controller.render format => resource_errors, :status => :bad_request
  end

  # Renders full messages instead of a list of error fields with messages
  def json_resource_errors
    {:errors => resource.errors.full_messages}
  end
end
