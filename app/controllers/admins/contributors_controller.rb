class Admins::ContributorsController < Admins::ApplicationController
<<<<<<< HEAD
  def auto
      contributors = Contributor.order(:name).where("name Like ?", "%#{params[:search]}%")
      render :json => contributors.map {|p| Hash[id: p.id, label: "#{p.email}-#{p.name}", name: p.name]}
  end

=======
  load_and_authorize_resource
  def show
    @contributors = Contributor.all
    respond_with(@contributors)
  end
>>>>>>> origin/master
end
