class Page < Resource
  
  def self.base_folder
    borg(:data_dir)
  end
  
  def self.fromRawData(path, raw_data)
    p = Page.new
    p.path = path
    
    if p.is_content?(path)
      p.raw_data = raw_data
      p.parse
      return p
    else
      return nil
    end
  end
  
  def self.fromPath(path)
    rpath = @@finder.find(path, base_folder)
    rpath.blank? ? nil : Page.new(rpath[0])
  end
  
  def self.allFromPath(path, recursive=true)
    rpaths = recursive  ?
             @@lister.list(path, base_folder) :
             @@finder.find_and_prune(path, base_folder)
    
    rpaths = [] if rpaths.blank?
    rpaths.map { |rpath| Page.new(rpath) }
  end
  
  def initialize(rpath=nil)
    super()
    @fresh = true
    @content = ""
    @headers = {}
    @rpath = rpath
  end
      
  def is_blog?
    path[0] =~ /(19|20)\d\d/
  end
  
  def fresh?
    @fresh
  end
  
  def headers
    parse if fresh?
    @headers
  end
    
  def h(key,default_value=nil)
    parse if fresh?
    @headers[key] || default_value
  end
  
  def author
    h(:author)
  end
  
  def author_mail
    h(:author_mail)
  end
  
  def title
    parse if fresh?
    @title
  end

  # Returns the page content, stripping the first heading
  def titleless_content
    parse if fresh?
    @content.sub(/h\d\..+/, '')
  end
  
  def content
    parse if fresh?
    @content
  end
  
  def summarize
    parse if fresh?
    @content = @summary
  end
  
  def comments
    @comments ||= Comment.fromPage(self)
  end
  
  def parse
    raw_headers = []
    
    headers_finished = false  
    raw_data.each_line do |l|
      headers_finished = true if l !~ /^#/
      raw_headers << l.chomp if l =~ /^#/ && !headers_finished
      
      @content << l if headers_finished
      @title = $1.strip if @title.nil? && l.strip =~ /^h\d\.(.+)/
    end
    
    @headers = parse_headers(raw_headers)
    @summary = parse_summary(@content)
    @fresh = false    
  end
  
  private
  
  # Parse headers from their raw reading
  def parse_headers(raw_headers)
    headers = {}
    raw_headers.each do |h|
      if h =~ /^# *([a-zA-Z_]+) *:(.*)/
        h_key = $1.downcase.intern
        h_value = $2.split(",").collect { |v| v.strip }
        if h_value.length > 0 # ignore empty headers
          headers[h_key] = h_value.length > 1 ? h_value : h_value[0]
        end
      end
    end
    
    return headers
  end    
  
  # Extracts the summary from a given page. The summary is composed of the first header (if any)
  # and the first paragraph.
  def parse_summary(content)
    summary = ""
    status = :pre_header
    content.each_line do |l|
      
      # Verify status change
      case status
      when :pre_header
        if l.strip =~ /^h\d\.(.+)/
          status = :header 
        end
        status = :paragraph if status != :header && l.strip.length > 0
      when :header
        status = :post_header
      when :post_header
        status = :paragraph if l.strip.length > 0
      when :paragraph
        break if l.strip =~ /^h\d\./ || l.strip.length == 0
      end
      summary << l
      
    end        
    return summary
  end
  
end