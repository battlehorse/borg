ActionController::Routing::Routes.draw do |map|
  # See how all your routes lay out with "rake routes"

  # Website root
  map.root :controller => "list",
    :action => "welcome",
    :path => [ Time.now.year.to_s ]
  
  # Main URLs
  map.page "page/*path" ,
    :controller => "page",
    :action => "view"
    
  map.connect "comments.rss",
    :controller => "list",
    :action => "comment",
    :format => "rss"
  
  map.list "list/*path" ,
    :controller => "list" ,
    :action => "list"
    
  map.connect "blog.rss",
    :controller => "list",
    :year => Time.now.year.to_s,
    :action => "blog",
    :format => "rss"
  
  
  map.blog "blog/:year/:month/:day" ,
    :controller => "list" ,
    :action => "blog",
    :requirements => { :year => /(19|20)\d\d/ , :month => /[01]\d/ , :day => /[0-3]\d/ },
    :year => Time.now.year.to_s,
    :day => nil,
    :month => nil  
    
  map.tag "tag/:id" ,
    :controller => "tags" ,
    :action => "show"
    
  # OpenID
  map.openid "login", 
    :controller => "login" , 
    :requirements => { :method => :get }    
  
  # CRUD Actions
  map.create "create/*path" ,
    :controller => "edit" ,
    :action => "create"    
    
  map.edit "edit/*path" ,
    :controller => "edit" ,
    :action => "read"
    
  map.preview "preview" ,
    :controller => "edit" ,
    :action => "preview"
    
  map.save "save/*path" ,
    :controller => "edit", 
    :action => "save"
    
  map.delete "delete/*path" ,
    :controller => "edit",
    :action => "delete"
    
  map.saveComment "saveComment/*path" ,
    :controller => "comment",
    :action => "save"

    
    
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
