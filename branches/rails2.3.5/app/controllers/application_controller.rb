require 'borg/util'

class ApplicationController < ActionController::Base
  include Borg::Util

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :load_configs, :load_sidebar_and_toolbar  
  
  private
  
  def load_configs
    require 'config/environments/borg_' + RAILS_ENV
  end
  
  def load_sidebar_and_toolbar
    path = params["path"] || []
    path = path[0..(path.length-2)] if is_content?(path) 
    
    @sidebar = Page.fromPath(path.clone << "sidebar.html")
    @toolbar = Page.fromPath(path.clone << "toolbar.html")    
  end  
end
