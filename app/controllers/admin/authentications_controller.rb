class Admin::AuthenticationsController < AdministratorController
  before_filter :authenticate_administrator_with_http_basic

  def create
    session = AdministratorSession.create(admin_session_params)
    render :json => session, status: :created
  end

  def admin_session_params
    {
      :administrator => current_admin
    }
  end
end
