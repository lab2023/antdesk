class Contributors::ApplicationsController < Contributors::ApplicationController
  def index
    @applications = Application.all
    respond_with(@applications)
  end

  def show
    @application = Application.find(params[:id])
    respond_with(@application)
  end
end
