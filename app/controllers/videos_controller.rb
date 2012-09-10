class VideosController < Contributors::ApplicationController
  def show
    @video = @current_application.videos.find(params[:id])
    @video.provider = @video.provider.html_safe
    respond_with(@video)
  end
end
