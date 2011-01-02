Borg2::Application.routes.draw do
  # See how all your routes lay out with "rake routes"

  # Website root
  root :to => "list#welcome"
  
  # Main URLs
  match 'page/*path' => 'page#view', :as => :page
  match 'list/*path' => 'list#list', :as => :list
  match 'attach/*path' => 'attach#read', :as => :attach
  match 'tag/:id' => 'tags#show', :as => :tag
  match 'blog/:year/:month/:day' => 'list#blog',
    :constraints => { :year => /(19|20)\d\d/ , :month => /[01]\d/ , :day => /[0-3]\d/ },
    :defaults => {:year => Time.now.year.to_s, :day => nil, :month => nil}

  # Feeds
  match 'comments.rss' => 'list#comment', :defaults => { :format => 'rss' }
  match 'blog.rss' => 'list#blog' , :defaults => { :format => 'rss', :year => Time.now.year.to_s }

  # Single files
  match 'robots.txt' => 'sitemap#robots'
  match 'sitemap.xml' => 'sitemap#sitemap'

  # Social buttons
  match 'social/buttons/*path' => 'social#buttons', :as => :socialbuttons

  # OpenID
  get 'login' => 'login#login'

  # CRUD Actions
  match 'edit/new' => 'edit#new', :as => :new
  match 'create/*path' => 'edit#create', :as => :create
  match 'edit/*path' => 'edit#read', :as => :edit
  match 'preview/*path' => 'edit#preview', :as => :preview
  match 'livepreview/*path' => 'edit#livepreview', :as => :livepreview
  match 'save/*path' => 'edit#save', :as => :save
  match 'delete/*path' => 'edit#delete', :as => :delete
  match 'saveComment/*path' => 'comment#save', :as => :saveComment

end
