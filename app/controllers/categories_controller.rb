class CategoriesController < Contributors::ApplicationController
  def show
    @category = @current_application.categories.find(params[:id])
    respond_with(@category)
  end
end
