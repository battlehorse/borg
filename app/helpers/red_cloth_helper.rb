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
      ::Rails.logger.debug "Replacing #{snip[:text]}(#{snip[:start]}, #{snip[:end]}): #{replacement}"
    end
    outdata << data[checkpoint..(data.length-1)]
    # ::Rails.logger.debug outdata
    return outdata
  end
  
  def textile(data)
    return nil if data.nil?

    data = data.content if data.respond_to?(:content)
    return nil if data.nil?
    
    br = BorgRedCloth.new
    br.parse(data)

    # Fix internal links and replace 'default' (or 'clipart') images:
    #
    # plain pages use square [] brackets
    # list pages use curly {} brackets
    # blog pages use angled <> brackets
    # attachments are wrapped within ##
    # tag pages just use "tags"
    #
    # Cliparts use '__' prefix and suffix.
    data = replace(data, br.links) do |link|
      if link.start_with? '__'
        # clipart
        BorgConfig[:default_img_url] + link[2..(link.length-3)].downcase + ".png"
      elsif link.start_with? '['
        page_path({:path => link[1, link.length-2].split('/')})
      elsif link.start_with? '{'
        list_path({:path => link[1, link.length-2].split('/')})
      elsif link.start_with? '<'
        link.gsub(/<(\d\d\d\d)?\/?([01]\d)?\/?([0-3]\d)?>/) do 
          blog_path({ :year => $1, :month => $2, :day => $3 })
        end
      elsif link.start_with? '#'
        if BorgConfig[:attach_serving_url].empty?
          attach_path({:path => link[1, link.length-2].split('/')})
        else
          BorgConfig[:attach_serving_url] + link[1, link.length-2]
        end
      elsif link == "tags"
        url_for({:controller => "tags", :only_path => true})
      end
    end

    r = RedCloth.new data
    r.to_html.html_safe
  end  
end