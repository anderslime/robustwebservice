class Admin::AdministratorsController < AdministratorController
  before_filter :authenticate_administrator_with_token

  def index
    respond_with Administrator.all
  end

  def show
    respond_with Administrator.find(params[:id])
  end

  def update
    admin = Administrator.find(params[:id])
    admin.update_attributes(params[:administrator])
    respond_with admin
  end

  def destroy
    Administrator.find(params[:id]).destroy
    render :nothing => true, :status => :ok
  end

  def create
    respond_with Administrator.create(params[:administrator])
  end
end
