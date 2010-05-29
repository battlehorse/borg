class PageController < ApplicationController
  
  def view
    @page = Page.fromPath(params["path"])
    render_404 and return if @page.nil?
  end
    
end