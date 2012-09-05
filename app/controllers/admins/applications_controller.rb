class Admins::ApplicationsController < Admins::ApplicationController
  def index
    @applications = Application.all
    respond_with(@applications)
  end

  def show
    @application = Application.find(params[:id])
    respond_with(:admins, @application)
  end

  def new
    @application = Application.new
    respond_with(:admins, @application)
  end

  def edit
    @application = Application.find(params[:id])
  end

  def create
    @application = Application.new(params[:application])
    @application.save
    respond_with(:admins, @application)
  end

  def update
    @application = Application.find(params[:id])
    @application.update_attributes(params[:application])
    respond_with(:admins, @application)
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    respond_with(:admins, @application)
  end
end
