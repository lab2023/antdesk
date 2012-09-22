class CategoriesController < ApplicationController

  def show
    @category = @current_application.categories.find(params[:id])
    @category_videos = @current_application.categories.find(params[:id]).videos.active.uniq.paginate(:page => params[:video_page])
    @category_articles = @current_application.categories.find(params[:id]).articles.active.uniq.paginate(:page => params[:article_page])
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @category.name, :category_path
    respond_with(@category)
  end
end
