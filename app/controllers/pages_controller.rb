class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
    respond_with(@current_application)
  end


end
