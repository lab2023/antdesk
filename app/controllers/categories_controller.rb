class CategoriesController < Contributors::ApplicationController
  before_filter :current_application

  def show
    @category = @current_application.categories.find(params[:id])
    respond_with(@category)
  end

private

  def current_application
    @current_application = !Application.find_by_cname_domain(request.env['HTTP_HOST']) ? nil : Application.find_by_cname_domain(request.env['HTTP_HOST'])
  end
end
