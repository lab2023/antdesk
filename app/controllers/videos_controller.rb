class VideosController < ApplicationController
  def show
    @video = @current_application.videos.find_by_id_and_status(params[:id], true)
    @video.provider = @video.provider.html_safe
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @video.name.camelize, :video_path
    respond_with(@video)
  end
end
