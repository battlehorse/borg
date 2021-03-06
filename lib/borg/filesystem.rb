require 'borg/util'

module Borg
    
  # An ultra-thin layer to abstract filesystem loading
  class FileSystem
    include Borg::Util
    
    def load(rpath)
      ::Rails.logger.debug "Physically loading #{rpath}"
      File.new(rpath).read
    end
    
    def save(rpath, content)
      ::Rails.logger.debug "Storing #{content.size} bytes to #{rpath}"
      
      # create folder if needed
      create_folder(rpath)
      
      File.open(rpath,"w") do |f|
        f.puts content
      end  
    end
    
    def delete(rpath)
      ::Rails.logger.debug "Deleting #{rpath}"
      
      raise "Page #{rpath} to be deleted is not a file" if !is_file?(rpath.split("/"))
      File.delete(rpath) # may raise an error if file cannot be deleted
      
      folder_path = rpath.split("/")
      while folder_path.pop && dir_empty?(folder = folder_path.join('/'))
        ::Rails.logger.debug "Deleting #{folder}"
        Dir.delete(folder)
      end
    end
    
    def dir_empty?(folder)
      Dir.new(folder).entries.reject { |e| e == '.' || e == '..' }.length == 0
    end      
    
    def create_folder(rpath)
      tokens = rpath.split("/")
      tokens = tokens[0..(tokens.length-2)]
      
      raise "Destination folder #{tokens.join('/')} appears to be a file?" if is_file?(tokens)
      
      f = "/"
      tokens.each do |t|
        f = "#{f}/#{t}"
        if !File.exists?(f)
          Dir.mkdir(f)  # may raise SystemCallError if dir cannot be created
        end
      end
    end    
    private :create_folder
    
  end
end