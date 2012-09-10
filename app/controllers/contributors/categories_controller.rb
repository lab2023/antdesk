class Contributors::CategoriesController < Contributors::ApplicationController

  load_and_authorize_resource

  def index
    @categories = @application.categories
    respond_with(:contributors, @application, @categories)
  end

  def show
    @category = @application.categories.find(params[:id])
    respond_with(:contributors, @application, @category)
  end

  def new
    @category = Category.new
    respond_with(:contributors, @application, @category)
  end

  def edit
    @category = @application.categories.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    @category.application_id = @application.id;
    @category.save
    respond_with(:contributors, @application, @category)
  end

  def update
    @category = @application.categories.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(:contributors, @application, @category)
  end

  def destroy
    @category = @application.categories.find(params[:id])
    @category.destroy
    respond_with(:contributors, @application, @category)
  end

end
