class Contributors::CategoriesController < Contributors::ApplicationController
  before_filter :find_application
  def index
    @categories = @application.categories.all
    respond_with(:contributors, @application, @categories)
  end

  def show
    @category = Category.find(params[:id])
    respond_with(:contributors, @application, @category)
  end

  def new
    @category = Category.new
    respond_with(:contributors, @application, @category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    @category.application_id = @application.id;
    @category.save
    respond_with(:contributors, @application, @category)
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(:contributors, @application, @category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with(:contributors, @application, @category)
  end

private

  def find_application
    @application = Application.find(params[:application_id])
  end
end
