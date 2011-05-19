require 'borg/util'

class ApplicationController < ActionController::Base
  include Borg::Util

  helper :all # include all helpers, all the time
  protect_from_forgery
  
  before_filter :load_configs, :load_sidebar_and_toolbar, :detect_mobile
  
  # Uncomment this line to test error pages locally.
  # alias_method :rescue_action_locally, :rescue_action_in_public
  
  layout :layout_for_device
  
  def render_optional_error_file(status_code)
    if status_code == :not_found
      render_404
    else
      super
    end
  end

  def path_from_params
    if params[:path]
      params[:path].is_a?(String) ? params[:path].split('/') : params[:path]
    else
      []
    end
  end

  private
  
  def load_configs
    require 'borg/config/borg_' + ::Rails.env
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
  
  def render_404
    # Load the default toolbar, create an empty sidebar.
    @toolbar = Page.fromPath(['toolbar.html'])
    @sidebar = Page.newEmpty(['sidebar.html'])
    render :template => "errors/404", :status => 404
    true  # so we can do "render_404 and return"
  end

  def load_sidebar_and_toolbar
    path = path_from_params
    path = path[0..(path.length-2)] if is_content?(path) 
    
    @show_sidebar = true
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
