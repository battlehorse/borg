require 'borg/finder'
require 'borg/util'

module Borg
    
    # This page is responsible for extracting list of valid pages from
    # folders.
    class Lister
      include Borg::Util
      
      def list(path,base_folder, recursive = true, strict_html_content=false)
        finder = Borg::Finder.new
        
        res = []
        rpath = root(path, base_folder)
        if File.directory?(rpath)
          res << finder.find_and_prune(path, base_folder, strict_html_content)
            
          if recursive
            Dir.new(rpath).
              entries.
              reject { |e| !File.directory?(rpath + "/" + e) }.
              reject { |e| e =~ /^\./ }.
              each { |e|  res << list(path.clone << e,base_folder, recursive)}  # recursion
          end
        end
        res =  res.flatten.sort_by { |rpath| test(?M, rpath) }.reverse
        return res;
      end
      
    end
end