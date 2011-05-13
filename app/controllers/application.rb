require 'borg/util'

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  include Borg::Util
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '873b45327d0227959765fb769b923d49'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  before_filter :load_configs, :load_sidebar_and_toolbar  
  
  private
  
  def load_configs
    require 'environments/borg_' + RAILS_ENV
  end
  
  def load_sidebar_and_toolbar
    path = params["path"] || []
    path = path[0..(path.length-2)] if is_content?(path) 
    
    @sidebar = Page.fromPath(path.clone << "sidebar.html")
    @toolbar = Page.fromPath(path.clone << "toolbar.html")    
  end
end
