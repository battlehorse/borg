require 'redcloth'
require 'borg/redcloth'

module RedClothHelper
  
  def replace(data, snippets)
    return data if snippets.length == 0
    outdata = ""
    checkpoint = 0
    snippets.each do |snip|
      outdata << data[checkpoint..(snip[:start]-1)]
      outdata << (replacement = yield snip[:text])
      checkpoint = snip[:end]+1
      RAILS_DEFAULT_LOGGER.debug "Replacing #{snip[:text]}(#{snip[:start]}, #{snip[:end]}): #{replacement}"
    end
    outdata << data[checkpoint..(data.length-1)]
    # RAILS_DEFAULT_LOGGER.debug outdata
    return outdata
  end
  
  def textile(data)
    return nil if data.nil?

    data = data.content if data.respond_to?(:content)
    return nil if data.nil?
    
    br = BorgRedCloth.new
    br.parse(data)
    
    # Replace 'default' (or 'clipart') images
    data = replace(data, br.cliparts) do |text|
      BorgConfig[:default_img_url] + text[2..(text.length-3)].downcase + ".png"
    end
    
    # Fix internal links
    # plain pages use square [] brackets
    # list pages use curly {} brackets
    # blog pages use angled <> brackets
    # attachments are wrapped within ##
    # tag pages just use "tags"
    data = replace(data, br.links) do |link|
      if link.start_with? '['
        page_path({:path => link[1, link.length-2].split('/')})
      elsif link.start_with? '{'
        list_path({:path => link[1, link.length-2].split('/')})
      elsif link.start_with? '<'
        link.gsub(/<(\d\d\d\d)?\/?([01]\d)?\/?([0-3]\d)?>/) do 
          blog_path({ :year => $1, :month => $2, :day => $3 })
        end
      elsif link.start_with? '#'
        attach_path({:path => link[1, link.length-2].split('/')})
      elsif link == "tags"
        url_for({:controller => "tags", :only_path => true})
      end
    end
    
    r = RedCloth.new data
    r.to_html
  end  
end