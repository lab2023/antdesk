class Admins::DashboardController < Admins::ApplicationController
  # To change this template use File | Settings | File Templates.
  def index
    @applications = Application.all.paginate(:page => params[:page])
    respond_with(@applications)
  end
end