class VideosController < Contributors::ApplicationController
  before_filter :current_application


  def show
    @video = @current_application.videos.find(params[:id])
    @video.provider = @video.provider.html_safe
    respond_with(@video)
  end

private

  def current_application
    @current_application = !Application.find_by_cname_domain(request.env['HTTP_HOST']) ? nil : Application.find_by_cname_domain(request.env['HTTP_HOST'])
  end
end
