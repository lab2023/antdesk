# encoding: utf-8
class Admins::ApplicationsController < Admins::ApplicationController

  load_and_authorize_resource

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
    @application.contributors << Contributor.find(@application.owner_id)
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
