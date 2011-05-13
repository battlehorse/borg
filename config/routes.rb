Borg2::Application.routes.draw do
  # See how all your routes lay out with "rake routes"

  # Change the scope parameter if your application is being served from a subdomain
  # E.g.: scope "/subdomain" do ... end
  scope "/" do
    # Website root
    root :to => "list#welcome"
  
    # Main URLs
    match 'page/*path' => 'page#view', :as => :page
    match 'list/*path' => 'list#list', :as => :list
    match 'attach/show' => 'attach#show'
    match 'upload' => 'attach#upload', :as => :upload
    match 'deleteUpload/*path' => 'attach#delete', :as => :deleteUpload
    match 'attach/*path' => 'attach#fetch', :as => :attach
    match 'tag/:id' => 'tags#show', :as => :tag
    match 'blog(/:year(/:month(/:day)))' => 'list#blog',
      :constraints => { :year => /(19|20)\d\d/ , :month => /[01]\d/ , :day => /[0-3]\d/ },
      :defaults => {:year => Time.now.year.to_s, :day => nil, :month => nil},
      :as => :blog
  
    # Feeds
    match 'comments.rss' => 'list#comment', :defaults => { :format => 'rss' }
    match 'blog.rss' => 'list#blog' , :defaults => { :format => 'rss', :year => Time.now.year.to_s }
  
    # Single files
    match 'robots.txt' => 'sitemap#robots'
    match 'sitemap.xml' => 'sitemap#sitemap'
  
    # Social buttons
    match 'social/buttons/*path' => 'social#buttons', :as => :socialbuttons
    match 'social/retweet.js' => 'social#retweet'
  
    # OpenID
    get 'login' => 'login#index'
  
    # CRUD Actions
    match 'edit/new' => 'edit#new', :as => :new
    match 'create(/*path)' => 'edit#create', :as => :create
    match 'edit/*path' => 'edit#read', :as => :edit
    match 'preview/*path' => 'edit#preview', :as => :preview
    match 'livepreview/*path' => 'edit#livepreview', :as => :livepreview
    match 'save/*path' => 'edit#save', :as => :save
    match 'delete/*path' => 'edit#delete', :as => :delete
    match 'saveComment/*path' => 'comment#save', :as => :saveComment
  
    # Default routing
    match ':controller(/:action(/:id(.:format)))'
  end
end
