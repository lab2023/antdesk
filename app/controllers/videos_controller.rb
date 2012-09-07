class VideosController < Contributors::ApplicationController
  def show
    @video = @current_application.videos.find(params[:id])
    respond_with(@video)
  end
end
