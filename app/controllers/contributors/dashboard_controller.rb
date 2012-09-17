class Contributors::DashboardController < Contributors::ApplicationController
  skip_before_filter :find_application

  def index
    @applications = current_contributor.applications.paginate(:page => params[:page])
    respond_with(@applications)
  end
end