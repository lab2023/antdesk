class ArticlesController < Contributors::ApplicationController
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
end
