class PageController < ApplicationController
  
  def view
    # Only editors can see pages that are still drafts
    can_see_drafts = session[:user_id] && session[:user_id].is_editor
    @page = Page.fromPath(path_from_params, :include_drafts => can_see_drafts)
    render_404 and return if @page.nil?
    @show_sidebar = @page.enable_sidebar?
  end
    
end