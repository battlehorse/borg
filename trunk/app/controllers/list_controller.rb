class ListController < ApplicationController
  
  def list
    # non-recursive listing
    @pages = Page.allFromPath(params["path"] || [], false).each { |page| page.summarize }
  end
    
  def blog
    path = [] << params["year"] << params["month"] << params["day"]
    params["path"] = path.compact
    
    # recursive listing
    @pages = Page.allFromPath(params["path"] || []).each { |page| page.summarize }
    @pages = apply_blog_time_ordering(@pages)
    
    render :action => "list"
  end
    
  def welcome
    @welcome = Page.fromPath(["index.html"])
    
    @pages = Page.allFromPath(params["path"] || []).each { |page| page.summarize } 
    @pages = apply_blog_time_ordering(@pages)[0..9] # only 10 items in the homepage
    
    render :action => "list"
  end
  
  def comment
    # recursive listing of comments ( but show only the last 20 )
    @comments = Comment.allFromPath(params["path"] || [])[0..19]
  end
  
  # For blog entries, order items by blog folder (aka, blog entry time)
  # rather than modification date  
  def apply_blog_time_ordering(pages)
    pages.sort_by { |page| page.path.join('') }.reverse
  end
  private :apply_blog_time_ordering
      
end
