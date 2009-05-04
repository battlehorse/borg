class Comment < Page
  
  def self.base_folder
    borg(:comment_dir)
  end
  
  def self.fromPage(page)
    allFromPath(toCommentPath(page.path)).reverse # older comments go first
  end
  
  def self.allFromPath(path, recursive=true)
    path = toCommentPath(path)
    rpaths = recursive  ?
             @@lister.list(path, base_folder) :
             @@finder.find_and_prune(path, base_folder)
    
    rpaths = [] if rpaths.blank?
    rpaths.map { |rpath| Comment.new(rpath) }
  end
  
  def self.fromParams(path, params)
    c = Comment.new
    c.path = [ toCommentPath(path) , Time.now.to_f.to_s.sub(/\./,"_") + ".html" ].flatten
    
    raw_data = ''
    raw_data << "# AUTHOR: #{params['author']}\n" unless params["author"].blank?
    raw_data << "# AUTHOR_MAIL: #{params['author_mail'].sub(/@/," at ").sub(/\./," dot ")}\n" unless params["author_mail"].blank?
    raw_data << "\n" << params["content"] unless params["content"].blank?
    
    c.raw_data = raw_data
    c.parse
    
    return c
  end
  
  def initialize(rpath=nil)
    super
  end
  
  def self.toCommentPath(path)
    path.map { |token| token.gsub(/\.html/,".comments") }
  end
  
  def page
    Page.fromPath(getPagePath)
  end
      
  def validate
    errors.add(:author, "field cannot be empty") if author.blank? || author =~ /^\s*$/
    errors.add(:author_mail,"field must be a valid e-mail address") if author_mail.blank? || author_mail.sub(/ at /,"@").sub(/ dot /,".") !~ /^[^@]+@[^\.]+\..+$/
    
    non_empty_content = false
    if !@content.blank?
      @content.each_line { |l| non_empty_content ||= l !~ /^\s*$/ }
    end
    unless non_empty_content
      errors.add(:content,"field cannot be empty")
    end
    
    return errors.empty?
  end  
  
  def getPagePath
    ppath = path.clone
    ppath.slice!(ppath.length-1)
    ppath.last.gsub!(/\.comments$/, ".html")
    
    return ppath
  end
  private :getPagePath
  
end