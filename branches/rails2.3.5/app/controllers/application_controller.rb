require 'borg/util'

class ApplicationController < ActionController::Base
  include Borg::Util

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :load_configs, :load_sidebar_and_toolbar, :detect_mobile
  
  layout :layout_for_device
    
  private
  
  def load_configs
    require 'config/environments/borg_' + RAILS_ENV
  end
  
  def layout_for_device
    @mobile ? 'mobile' : 'application'
  end
  
  def detect_mobile
    # check whether the current theme supports mobile rendering.
    if borg(:css_template) != 'bigG'
      @mobile, @android, @iphone = false, false, false
      return
    end
    
    # check whether the mobile setting has been overriden from url parameters.
    @android, @iphone = params[:android], params[:iphone]
    
    if @android || @iphone
      @mobile = true
      return
    end

    @iphone = request.user_agent.downcase =~ /iphone/  # iphone and ipad
    @android = request.user_agent.downcase =~ /android/
    @mobile = @android || @iphone
  end
  
  def load_sidebar_and_toolbar
    path = params["path"] || []
    path = path[0..(path.length-2)] if is_content?(path) 
    
    @sidebar = Page.fromPath(path.clone << sidebar_page_name)
    @toolbar = Page.fromPath(path.clone << toolbar_page_name)    
  end
  
  def sidebar_page_name
    "sidebar.html"
  end
  
  def toolbar_page_name
    "toolbar.html"
  end
end
