class AttachController < ApplicationController

  def read
    render :text => params[:path], :layout => false
  end
end