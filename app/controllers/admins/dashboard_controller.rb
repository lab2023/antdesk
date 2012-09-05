class Admins::DashboardController < Admins::ApplicationController
  # To change this template use File | Settings | File Templates.
  def index
    @applications = Application.all
    respond_with(@applications)
  end
end