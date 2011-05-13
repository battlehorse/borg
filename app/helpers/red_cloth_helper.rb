require 'redcloth'

module RedClothHelper
  
  def textile(data)
    return nil if data.nil?

    data = data.content if data.respond_to?(:content)
    return nil if data.nil?
    
    # Replace 'default' images
    data = data.gsub(/__([A-Z\-]+)__/) { |t| BorgConfig[:default_img_url] + $1.downcase + ".png" }
    
    # Fix internal links
    
    # plain pages use square [] brackets
    data = data.gsub(/"([^"]+)":\[([^\]]*)\]/) { |t| "\"" + $1 + "\":" + page_path({:path => $2.split('/')}) }
    
    # list pages use curly {} brackets
    data = data.gsub(/"([^"]+)":\{([^}]*)\}/) { |t| "\"" + $1 + "\":" + list_path({:path => $2.split('/') }) }
    
    # blog pages use angled <> brackets
    data = data.gsub(/"([^"]+)":<(\d\d\d\d)?\/?([01]\d)?\/?([0-3]\d)?>/) { |t| "\"" + $1 + "\":" + blog_path({ :year  => $2,
                                                                                  :month => $3,
                                                                                  :day   => $4 }) }
    
    # tag pages just use "tags"
    data = data.gsub(/"([^"]+)":tags/) { |t| "\"" + $1 + "\":" + url_for({:controller => "tags"})  }

    
    r = RedCloth.new data
    r.to_html
  end  
end