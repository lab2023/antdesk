class ArticlesController < Contributors::ApplicationController

  def show
    @article = @current_application.articles.find(params[:id])
    respond_with(@article)
  end
end
