class Comment < Page

  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors[attribute] << (options[:message] || "is not a valid email address") unless
        (value || '').sub(/ at /,"@").sub(/ dot /,".") =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
  end 

  validates_presence_of :author, :content
  validates :author_mail, :presence => true, :email => true
  
  def self.base_folder
    borg(:comment_dir)
  end
  
  def self.fromPage(page)
    allFromPath(toCommentPath(page.path)).reverse # older comments go first
  end
  
  def self.allFromPath(path, recursive=true)
    path = toCommentPath(path)
    rpaths = recursive  ?
             @@lister.list(path, base_folder, true, true) :
             @@finder.find_and_prune(path, base_folder, true)
    
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
    path.map { |token| token.gsub(/\.html/,"_comments") }
  end
  
  def page
    Page.fromPath(getPagePath)
  end
  
  def getPagePath
    ppath = path.clone
    ppath.slice!(ppath.length-1)
    ppath.last.gsub!(/\_comments$/, ".html")
    
    return ppath
  end
  private :getPagePath
  
end