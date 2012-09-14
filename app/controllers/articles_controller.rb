class ArticlesController < ApplicationController
  def show
    @article = @current_application.articles.find_by_id_and_status(params[:id], true)
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @article.name.camelize, :article_path
    respond_with(@article)
  end
end
