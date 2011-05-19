class PageController < ApplicationController
  
  def view
    @page = Page.fromPath(path_from_params)
    @show_sidebar = @page.enable_sidebar?
    render_404 and return if @page.nil?
  end
    
end