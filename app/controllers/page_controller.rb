class PageController < ApplicationController
  
  def view
    @page = Page.fromPath(path_from_params)
    render_404 and return if @page.nil?
  end
    
end