#TODO: this class needs optimization to avoid complete site scanning to load tags
# it is ok only for very small sites, just like mine :-)
class TagsController < ApplicationController
  
  def index
    @tags = {}
    can_see_drafts = session[:user_id] && session[:user_id].is_editor    
    
    # scan all the contents recursively    
    Page.allFromPath(
      [], :recursive => true, :include_drafts => can_see_drafts).each do |page|
      if page.h(:tags)
        ([] << page.h(:tags)).flatten.each do |tag|
          @tags[tag] ||= 0
          @tags[tag] += 1
        end
      end      
    end
  end
  
  def show
    @tag = params["id"].gsub(/_/," ") # replace underscores with spaces
    can_see_drafts = session[:user_id] && session[:user_id].is_editor

    # scan all the contents recursively
    @pages = Page.
             allFromPath([], :recursive => true, :include_drafts => can_see_drafts).
             reject { |page| !([] << page.h(:tags)).flatten.include?(@tag) }.
             each { |page| page.summarize }
  end
  
end