module Borg
  
  # General purpose utilities to be mixed in
  module Util
    
    def self.included(base)
      base.class_eval <<-EVAL
        def self.borg(key)
          BorgConfig[key]
        end
      EVAL
    end    
    
    def borg(key)
      BorgConfig[key]
    end    
    
    # prepends the repository location to a relative path
    def root(path, base_folder)
      base_folder + path.join("/").chomp("/")
    end
    
    def relative(rpath, base_folder)
      path = rpath.clone
      path = path.sub(Regexp.new('^' + base_folder), '')
      
      return path.split('/').reject { |token| token.blank? }
    end
    
    def prune(rpaths)
      return rpaths.reject { |rpath| rpath =~ /(sidebar|editbar|toolbar)\.html$/ }
    end
    
    def is_special?(path)
      path.length > 0 && path[path.length-1] =~ /(sidebar|editbar|toolbar)\.html/
    end
    
    def is_content?(path)
      path.length > 0 && path.last.downcase =~ /\.html$/
    end    
  end
end