# encoding: utf-8
require "application_responder"
class Contributors::ApplicationController < ActionController::Base
  helper :all
  self.responder = ApplicationResponder
  respond_to :html, :json, :xml
  WillPaginate.per_page = 10
  before_filter :find_application
  before_filter :authenticate_contributor!

  protect_from_forgery

  def find_application
    @application = current_contributor.applications.find(params[:application_id])
  end
  def current_ability
    @current_ability ||= ContributorAbility.new(current_contributor)
  end
end