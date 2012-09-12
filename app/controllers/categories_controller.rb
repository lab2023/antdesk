class CategoriesController < ApplicationController

  def show
    @category = @current_application.categories.find(params[:id])
    add_breadcrumb "Anasayfa", :root_path
    add_breadcrumb @category.name.camelize, :category_path
    respond_with(@category)
  end
end
