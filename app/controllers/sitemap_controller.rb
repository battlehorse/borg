require 'tree'

class SitemapController < ApplicationController
  include RedClothHelper
  
  def view  # for HTML sitemap page
    @pages = Page.allFromPath([]).sort_by { |page| page.path.join('/') }.reverse
    
    build_sitemap
    build_blogmap    
  end
  
  def robots  # for robots.txt
    render :layout => false, :content_type => "text/plain"
  end
  
  def sitemap  # for sitemap.xml
    # Priorities explained:
    # 1.0 : Home
    # 0.9 : Top level urls (blog, sitemap, contact) and all urls found in the toplevel toolbar
    # 0.8 : year-based blog urls
    # 0.5 (default): single pages, unless overriden by one of the above
    # 0.3 : month-based blog urls
    max_mtime = Time.gm(1970)
    @sitemap_urls = {}
    
    # Home, with high priority
    add_sitemap_url(root_url(:only_path => false), :priority => "1.0")    
    
    # All normal pages, with default priorities
    @pages = Page.allFromPath([])
    @pages.each do |page|
      page_mtime = File.new(page.rpath).mtime
      max_mtime = page_mtime if page_mtime > max_mtime
      add_sitemap_url(
        page_url(:path => page.path, :only_path => false),
        :lastmod => page_mtime.strftime("%Y-%m-%d"))
    end
    
    # HTML Sitemap url (:lastmod matching the newest article page.)
    add_sitemap_url(
      url_for(:controller => 'sitemap', :action => 'view', :only_path => false),
      :lastmod => max_mtime.strftime("%Y-%m-%d"),
      :priority => "0.9")
    
    # blog urls
    add_sitemap_url(blog_url(:only_path => false), :priority => "0.9")
    build_blogmap
    @blog_years.each_pair do |year, months|
      add_sitemap_url(
        blog_url(:year => year, :only_path => false), 
        :priority => "0.8")
      months.each_key do |month|
        add_sitemap_url(
          blog_url(:year => year, :month => month, :only_path => false),
          :priority => "0.3")
      end
    end      
    
    # Contact URL (might inherit :lastmod from previous page scan)
    add_sitemap_url(
      page_url(:path => borg(:contact_url).gsub(/^\//,'').split('/'), :only_path => false),
      :priority => "0.9")
    
    # URLs extracted from the top-level toolbar, if any.
    # (might inherit :lastmod from previous page scan)
    toolbar = Page.fromPath(['toolbar.html'])
    if toolbar
      # Render the toolbar and try to extract all local links.
      textile(toolbar).scan(/href="(.+)"/) do |groups|
        add_sitemap_url(make_absolute_url(groups[0]), :priority => "0.9") if groups[0] =~ /^\//
      end
    end

    if stale?(:last_modified => max_mtime)
      render :layout => false, :content_type => "text/xml", :type => :builder
      return
    end
  end
  
  private
  
  def make_absolute_url(relative_url)
    "#{request.protocol}#{request.host}#{request.port == 80 ? '' : ':' + request.port.to_s}#{relative_url_root}#{relative_url}"    
  end
  
  def add_sitemap_url(url, attributes)
    (@sitemap_urls[url] ||= {}).merge!(attributes)
  end
    
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