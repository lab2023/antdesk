class PagesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
    @application = Application.find(1)
    respond_with(@application)
  end


end
