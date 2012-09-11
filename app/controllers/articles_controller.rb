class ArticlesController < Contributors::ApplicationController
  before_filter :current_application
  require 'redcarpet/compat'

  def show
    @article = @current_application.articles.find(params[:id])
    @article.body = markdown(@article.body)
    respond_with(@article)
  end

private

  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Markdown.new(text, *options).to_html.html_safe
  end

  def current_application
    @current_application = !Application.find_by_cname_domain(request.env['HTTP_HOST']) ? nil : Application.find_by_cname_domain(request.env['HTTP_HOST'])
  end
end
