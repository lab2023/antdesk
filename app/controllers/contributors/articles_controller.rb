class Contributors::ArticlesController < Contributors::ApplicationController
  before_filter :find_application
  def index
    @articles = Article.all
    respond_with(:contributors, @application, @articles)
  end

  def show
    @article = Article.find(params[:id])
    respond_with(:contributors, @application, @article)
  end

  def new
    @article = Article.new
    respond_with(:contributors, @application, @article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    respond_with(:contributors, @application, @article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    respond_with(:contributors, @application, @article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_with(:contributors, @application, @article)
  end

private

  def find_application
    @application = Application.find(params[:application_id])
  end


end
