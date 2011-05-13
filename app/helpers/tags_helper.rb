module TagsHelper
  
  def cloud(tags)
    step = tags.size / 5.0
    min_occur = 0
    max_occur = 0
    
    # sort by count
    sorted_tags = tags.sort { |a,b| a[1] <=> b[1] }
    
    # partition into 5 sizes
    rendered_tags = {}
    sorted_tags.each_with_index do |kv,i|
      font_size = ((i+1)/step).to_i
      rendered_tags[kv[0]] = link_to kv[0], tag_path(kv[0].gsub(/ /,'_')), :class => "cloud#{font_size}"
      rendered_tags[kv[0]] << " "
    end 
    
    res = ""
    # sort tags alphabetically and print
    rendered_tags.sort { |a,b| a[0] <=> b[0] }.each do |kv|
      res += kv[1]
    end
    
    return res
  end
end
