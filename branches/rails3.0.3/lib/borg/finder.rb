require 'borg/util'

module Borg

  # This class is responsible for locating pages. Adopts various fallback techniques
  # to find the right page whenever the exact file does not exists.  
  class Finder
    include Borg::Util

    # Locates a borg page given its path ( such as ["programming","java","myfile.html"]).
    # A borg page can be a 'content' page or a 'list' page.
    # A content page can be a generic file or be restricted to have the '.html' extension.
    # If the content page is not found in its path, the higher level folders are searched.
    # A list page contains all the content pages in the requested folder.
    def find(path, base_folder=nil, strict_html_content=false)
      if strict_html_content ? is_content?(path) : is_file?(path)
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
          return Dir.entries(rpath).reject { |file| strict_html_content ? !is_content?([file]) : !is_file?([file]) }.map { |file| rpath + "/" + file }
        end
      end
      
      # page not found
      return nil
    end
    
    def find_and_prune(path, base_folder=nil, strict_html_content=false)
      res = find(path, base_folder, strict_html_content=false)
      unless res.nil?
        res = prune(res)
      end
      
      return res
    end
  
  end
end