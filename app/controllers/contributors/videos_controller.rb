class Contributors::VideosController < Contributors::ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  load_and_authorize_resource
  before_filter :find_application
  def index
    @videos = @application.videos
    respond_with(:contributors, @application, @videos)
  end

  def show
    @video = @application.videos.find(params[:id])
    @video.provider = @video.provider.html_safe
    respond_with(:contributors, @application, @video)
  end

  def new
    @video = Video.new
    respond_with(:contributors, @application, @video)
  end

  def edit
    @video = @application.videos.find(params[:id])
  end

  def create
    @video = Video.new(params[:video])
    @video.save
    respond_with(:contributors, @application, @video)
  end

  def update
    @video = @application.videos.find(params[:id])
    @video.update_attributes(params[:video])
    respond_with(:contributors, @application, @video)
  end

  def destroy
    @video = @application.videos.find(params[:id])
    @video.destroy
    respond_with(:contributors, @application, @video)
  end

private

  def find_application
    @application = current_contributor.applications.find(params[:application_id])
  end
end
