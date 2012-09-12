class Contributors::ApplicationsController < Contributors::ApplicationController
  load_and_authorize_resource
  skip_before_filter :find_application

  def show
    @application = current_contributor.applications.find(params[:id])
    respond_with(@application)
  end

end
