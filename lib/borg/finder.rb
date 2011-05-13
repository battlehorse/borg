require 'borg/util'

module Borg

  # This class is responsible for locating pages. Adopts various fallback techniques
  # to find the right page whenever the exact file does not exists.  
  class Finder
    include Borg::Util

    # Locates a borg page given its path ( such as ["programming","java","myfile.html"]).
    # A borg page can be a 'content' page or a 'list' page. 
    # A content page should end with the '.html' extension. If the content page is not found
    # in its path, the higher level folders are searched.
    # A list page contains all the content pages in the requested folder.
    def find(path, base_folder=nil)
      if is_content?(path)
        # This is expected to be a content page
        folderpath = path[0, path.length-1]
        fname = path.last
        
        while true
          filepath = root(folderpath.clone << fname, base_folder)
          if File.file?(filepath) 
            return [ filepath ]
          end
          
          break if folderpath.length == 0          
          folderpath = folderpath[0, folderpath.length-1]
        end
      else
        # This is expected to be a list page
        
        rpath = root(path, base_folder)
        if File.directory?(rpath)
          return Dir.entries(rpath).reject { |file| !is_content?([file]) }.map { |file| rpath + "/" + file }
        end
      end
      
      # page not found
      return nil
    end
    
    def find_and_prune(path, base_folder=nil)
      res = find(path, base_folder)
      unless res.nil?
        res = prune(res)
      end
      
      return res
    end
  
  end
end