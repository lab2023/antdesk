class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index
  before_filter :current_application

  def index
    if params[:search]
    @articles = @current_application.artciles.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    @videos = @current_application.videos.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    else
      respond_with(@current_application)
    end
  end

private

  def current_application
    @current_application = !Application.find_by_cname_domain(request.env['HTTP_HOST']) ? nil : Application.find_by_cname_domain(request.env['HTTP_HOST'])
  end

end
