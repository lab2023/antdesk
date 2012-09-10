# encoding: utf-8
require "application_responder"
class ApplicationController < ActionController::Base
  helper :all
  self.responder = ApplicationResponder
  respond_to :html, :json, :xml
  WillPaginate.per_page = 10

  before_filter :authenticate_user!
  before_filter :current_application
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Yetkisiz erişim."
    redirect_to root_url
  end

  def current_application
    @current_application = Application.find_by_cname_domain!(request.env['HTTP_HOST']) ? nil : Application.find_by_cname_domain!(request.env['HTTP_HOST'])
  end

begin
  def after_sign_in_path_for(resource_or_scope)
    if current_admin
      admins_dashboard_index_path
    elsif current_contributor
      contributors_dashboard_index_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if current_admin
      admins_dashboard_index_path
    elsif current_contributor
      contributors_dashboard_index_path
    else
      super
    end
  end
end
end