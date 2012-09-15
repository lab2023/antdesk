class Contributors::ArticlesController < Contributors::ApplicationController
  load_and_authorize_resource
  before_filter :find_application
  def index
    @articles = @application.articles.uniq
    respond_with(:contributors, @application, @articles)
  end

  def show
    @article = @application.articles.find(params[:id])
    respond_with(:contributors, @application, @article)
  end

  def new
    @article = Article.new
    respond_with(:contributors, @application, @article)
  end

  def edit
    @article = @application.articles.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    respond_with(:contributors, @application, @article)
  end

  def update
    @article = @application.articles.find(params[:id])
    @article.update_attributes(params[:article])
    respond_with(:contributors, @application, @article)
  end

  def destroy
    @article = @application.articles.find(params[:id])
    @article.destroy
    respond_with(:contributors, @application, @article)
  end

end
