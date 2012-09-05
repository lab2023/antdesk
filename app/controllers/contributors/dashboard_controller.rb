class Contributors::DashboardController < Contributors::ApplicationController
  def index
    @applications = Application.all
    respond_with(@applications)
  end
end