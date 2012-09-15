class ArticlesController < ApplicationController
  def show
    @article = @current_application.articles.active.find(params[:id])
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @article.name.camelize, :article_path
    respond_with(@article)
  end
end
