class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
    if params[:search]
      @search_articles = @current_application.articles.search(params[:search]).uniq
      @search_videos = @current_application.videos.search(params[:search]).uniq
      add_breadcrumb "Arama", :root_path
    else
      add_breadcrumb "Anasayfa", :root_path
      respond_with(@current_application)
    end
  end
end