# encoding: utf-8
class Contributors::ApplicationsController < Contributors::ApplicationController
  load_and_authorize_resource
  skip_before_filter :find_application

  def show
    @application = @current_contributor.applications.find(params[:id])
    respond_with(@application)
  end


  #GET
  def new_administrator

  end

  #POST
  def administrator
    contributor = Contributor.find_by_email(params[:email])
    application = @current_contributor.applications.find(params[:id])
    if contributor.present?
      if application.contributors.include?(contributor)
        flash[:error] = "Bu kullanıcı daha önce eklenmiş bir daha ekleyemezsiniz."
      else
        if application.contributors << contributor
          flash[:success] = "#{contributor.name}, #{contributor.email} başarı ile eklendi."
        else
          flash[:error] = "Böyle bir kullanıcı yok."
        end
      end
    else
      flash[:error] = "Böyle bir kullanıcı yok."
    end
    respond_with(:contributors, application)
  end
end