class VideosController < ApplicationController
  def show
    @video = @current_application.videos.active.find(params[:id])
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @video.categories.first.name, category_path(@video.categories.first)
    add_breadcrumb @video.name, :video_path
    respond_with(@video)
  end
end
