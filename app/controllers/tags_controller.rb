#TODO: this class needs optimization to avoid complete site scanning to load tags
# it is ok only for very small sites, just like mine :-)
class TagsController < ApplicationController
  
  def index
    @tags = {}
    
    # scan all the contents recursively
    Page.allFromPath([]).each do |page|
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

    # scan all the contents recursively
    @pages = Page.
             allFromPath([]).
             reject { |page| !([] << page.h(:tags)).flatten.include?(@tag) }.
             each { |page| page.summarize }
  end
  
end