module EditHelper
  
  def raw_content(page)
    raw_content = ""
    page.headers.each_pair do |k,v| 
      v = ([] << v).flatten.join(',')
      raw_content << '# ' << "#{k} : #{v}\n"
    end
    raw_content << page.content << "\n"
    
    return raw_content
  end
end