module BreadcrumbsHelper
  
  def render_breadcrumbs
    page = get_page
    path = folder_path(page)
    
    content = ""
    if page.is_blog?
      year, month, day = path
      append(content, link_to_blog(year))
      append(content, link_to_blog(year, month)) unless month.nil?
      append(content, link_to_blog(year, month, day)) unless day.nil?
    else
      cumulative_path = []
      path.each do |path_token|
        cumulative_path << path_token
        append(content, link_to(path_token.capitalize , list_path(:path => cumulative_path)))
      end
    end
  
    append(content, page.path.last) if page.is_content?(page.path)
    return content
  end
  
  private
  
  def append(buffer, breadcrumb)
    buffer << spacer_img << breadcrumb << "&nbsp;".html_safe
  end
  
  def spacer_img
    image_tag("borg/arrow.png") << "&nbsp;".html_safe
  end
  
  def link_to_blog(year, month = nil, day = nil)
    name = day || month || year
    link_to(name, blog_path(:year => year, :month => month, :day => day))
  end
  
  def get_page
    p = Page.new
    p.path = path_from_params
    return p
  end
  
  def folder_path(page)
    path = page.path
    if page.is_content?(page.path)
      path = path[0,path.length-1]
    end
    return path    
  end
  
  def path_from_params
    if params[:path]
      params[:path].is_a?(String) ? params[:path].split('/') : params[:path]
    else
      []
    end
  end  
  
end