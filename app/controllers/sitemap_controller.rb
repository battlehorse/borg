require 'tree'

class SitemapController < ApplicationController
  
  def view
    @pages = Page.allFromPath([]).sort_by { |page| page.path.join('/') }.reverse
    
    build_sitemap
    build_blogmap    
  end
  
  private
  
  def build_sitemap
    @sitemap = Tree::TreeNode.new("/" , { :name => "HomePage", :link_url => root_url , :depth => 0})
    @pages.each do |page|
      unless page.is_blog?
        
        # Start with the tree root as the current node
        curnode = @sitemap
        cumulative_path = []
        
        # For each path fragment
        page.path.each do |token|
          
          # Calculate the cumulativa path up to this point and a node key
          cumulative_path << token
          key = cumulative_path.join('/')
          
          # Create the tree node if it doesn't already exist, and add it to the tree
          if curnode[key].nil?
            content = { :name => token,
                        :link_url => is_content?(cumulative_path) ? 
                            page_path(:path => cumulative_path) : 
                            list_path(:path => cumulative_path),
                        :depth => curnode.content[:depth]+1 }
            curnode << Tree::TreeNode.new(key, content)
          end
          
          # Move the current node
          curnode = curnode[key]
        end
      end
    end
  end
  
  def build_blogmap  
    @blog_years = {}
    @pages.each do |page|
      if page.is_blog?
        # first token of the path represents the year
        year = @blog_years[page.path[0]] ||= {} 
        
        # second token of the path represents the month
        year[page.path[1]] = true
      end
    end
  end
  
end