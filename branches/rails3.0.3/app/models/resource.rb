require 'borg/util'
require 'borg/lister'
require 'borg/filesystem'
require 'borg/finder'

class Resource
  include Borg::Util
  include ActiveModel::Validations

  @@finder = Borg::Finder.new
  @@fs = Borg::FileSystem.new
  @@lister = Borg::Lister.new
  
  def self.base_folder
    "#{RAILS_ROOT}/public"
  end
  
  attr_accessor :rpath

  def path
    relative(@rpath, self.class.base_folder)
  end
  
  def path=(path)
    @rpath = root(path, self.class.base_folder)
  end
    
  def raw_data
    @raw_data ||= (@rpath.blank? ? "" : @@fs.load(@rpath))
  end
  
  def raw_data=(data)
    @raw_data = data
  end

  def store
    @@fs.save(@rpath, @raw_data)
  end
  
  def delete
    @@fs.delete(@rpath)
  end
  
  def to_s
    @rpath
  end  
    
end