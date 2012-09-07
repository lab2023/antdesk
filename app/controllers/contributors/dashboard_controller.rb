class Contributors::DashboardController < Contributors::ApplicationController
  def index
    @applications = current_contributor.applications
    respond_with(@applications)
  end
end