class VideosController < ApplicationController
  def show
    @video = @current_application.videos.active.find(params[:id])
    @video.provider = @video.provider.html_safe
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @video.name.camelize, :video_path
    respond_with(@video)
  end
end
