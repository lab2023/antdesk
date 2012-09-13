class Admins::ContributorsController < Admins::ApplicationController
  load_and_authorize_resource
  def show
    @contributors = Contributor.all
    respond_with(@contributors)
  end
end
