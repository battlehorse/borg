class Attachment < Resource
  
  attr_accessor :file, :file_size
  
  class FilesystemValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      message = "is not a valid path. " +
          "Directories and filenames must contain only letters, numbers, underscores and dashes. " +
          "Files (if specified) must have an extension. Path must be relative."
      record.errors[attribute] << (options[:message] || message) unless
        value =~ /([a-zA-Z0-9_-]+\/)*[a-zA-Z0-9_-]+\.[a-zA-Z0-9_-]+/
    end
  end
  
  validates :upload_path, :presence => true, :filesystem => true
  validates_presence_of :file
  validates_numericality_of :file_size, :less_than => BorgConfig[:max_upload_size], :allow_nil => true
  
  def self.base_folder
    borg(:attach_dir)
  end
  
  def self.newEmpty(uppath)
    att = Attachment.new
    att.upload_path = uppath
    return att
  end
  
  def self.allFromPath(path, recursive=true)
    rpaths = recursive  ?
             @@lister.list(path, base_folder) :
             @@finder.find_and_prune(path, base_folder)
    
    rpaths = [] if rpaths.blank?
    rpaths.map { |rpath| Attachment.new(rpath) }
  end  
  
  def self.fromParams(params)
    att = Attachment.new
    att.upload_path = params[:upload_path]
    if params[:file]
      att.file = params[:file]
      att.load_uploaded_file
    end
    return att
  end
  
  def initialize(rpath=nil)
    super()
    @rpath = rpath
  end  
  
  def upload_path
    path.join('/') + (is_file?(path) ? '' : '/')
  end
  
  def upload_path=(uppath)
    self.path = uppath.split('/')
  end
    
  def load_uploaded_file
    @file_size = @file.tempfile.size
    if !is_file?(path)
      self.upload_path +=  @file.original_filename
    end
    if @file_size < BorgConfig[:max_upload_size]
      @raw_data = IO.read(@file.tempfile)
    end
  end
  
end