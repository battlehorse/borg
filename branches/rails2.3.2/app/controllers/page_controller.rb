class PageController < ApplicationController
  
  def view
    @page = Page.fromPath(params["path"])
    render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404 and return if @page.nil?
  end
    
end