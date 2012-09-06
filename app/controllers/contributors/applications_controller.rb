class Contributors::ApplicationsController < Contributors::ApplicationController

  def show
    @application = Application.find(params[:id])
    respond_with(@application)
  end
end
