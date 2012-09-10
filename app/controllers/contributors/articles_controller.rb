require 'redcarpet/compat'
class Contributors::ArticlesController < Contributors::ApplicationController

  before_filter :find_application
  load_and_authorize_resource

  def index
    @articles = @application.articles
    respond_with(:contributors, @application, @articles)
  end

  def show
    @article = @application.articles.find(params[:id])
    @article.body =markdown(@article.body)
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

private

  def find_application
    @application = current_contributor.applications.find(params[:application_id])
  end

  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Markdown.new(text, *options).to_html.html_safe
  end

end
