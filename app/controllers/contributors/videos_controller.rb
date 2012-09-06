class Contributors::VideosController < Contributors::ApplicationController

  before_filter :find_application

  def index
    @videos = @application.videos
    respond_with(:contributors, @application, @videos)
  end

  def show
    @video = Video.find(params[:id])
    respond_with(:contributors, @application, @video)
  end

  def new
    @video = Video.new
    respond_with(:contributors, @application, @video)
  end

  def edit
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(params[:video])
    @video.save
    respond_with(:contributors, @application, @video)
  end

  def update
    @video = Video.find(params[:id])
    @video.update_attributes(params[:video])
    respond_with(:contributors, @application, @video)
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    respond_with(:contributors, @application, @video)
  end

  private

  def find_application
    @application = Application.find(params[:application_id])
  end

end
