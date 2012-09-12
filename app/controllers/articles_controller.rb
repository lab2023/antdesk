class ArticlesController < ApplicationController
  require 'redcarpet/compat'

  def show
    @article = @current_application.articles.find(params[:id])
    @article.body = markdown(@article.body)
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @article.name.camelize, :article_path
    respond_with(@article)
  end

private

  def markdown(text)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Markdown.new(text, *options).to_html.html_safe
  end
end
