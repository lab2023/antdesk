class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
    if params[:search]
      @search_articles = @current_application.articles.active.search(params[:search])
      @search_videos = @current_application.videos.active.search(params[:search])
      add_breadcrumb "Arama", :root_path
    elsif @current_application.present?
      @articles = @current_application.articles.active
      @videos = @current_application.videos.active
      add_breadcrumb "Anasayfa", :root_path
      respond_with(@current_application)
    end
  end
end
