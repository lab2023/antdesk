class ArticlesController < ApplicationController
  def show
    @article = @current_application.articles.active.find(params[:id])
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @article.categories.first.name, category_path(@article.categories.first)
    add_breadcrumb @article.name, :article_path
    respond_with(@article)
  end
end
