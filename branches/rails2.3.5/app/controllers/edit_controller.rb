class EditController < ApplicationController
  
  before_filter :check_permission
  
  # Show 
  def new
    @path = Time.now.strftime('%Y/%m/%d/yourpage.html')
  end
  
  # Creates a new borg page
  def create
    @kind = params[:kind] ||= 'page'
    if @kind == 'page'
      @title = "Create Page #{params["path"].join('/')}"
    elsif @kind == 'wave'
      @title = "Embed Wave in #{params["path"].join('/')}"
    else
      raise "Invalid page kind #{@kind}"
    end
    @cancel_url = root_path
    load_page_if_any
    render :action => "read"
  end
  
  def read
    @title = "Edit Page"
    @cancel_url = page_path :path => params["path"]
    load_page_if_any
  end
  
  def save
    p = Page.fromRawData(params["path"], params["content"])
    if p.nil?
      render :json => { :status => "ERR", :message => "Page not found" }.to_json
    else
      p.store
      render :json => { :status => "OK"}.to_json
    end
  end
  
  def delete
    raise "You tried to delete a folder" unless is_content? params["path"]
    p = Page.fromPath(params["path"])
    if p.nil?
      render :json => { :status => "ERR" , :message => "Page not found"}.to_json
    else
      p.delete
      render :json => { :status => "DELE"}.to_json
    end
  end
  
  def preview
    p = Page.fromRawData(params["path"], params["content"])
    render :partial => "shared/content" , :object => p
  end
  
  def livepreview
    render :layout => false
  end

  private
  
  def sidebar_page_name
    "editbar.html"
  end
  
  def check_permission
    unless session[:user_id] && session[:user_id].is_editor
      flash[:error] = "You don't have the rights to edit this page. Please login with an authorized user."
      redirect_to :controller => "page", :action => "view"
    end
  end
  
  def load_page_if_any
    raise "You tried editing a list page" unless is_content? params["path"]
    @page = Page.fromPath(params["path"]) || Page.new
  end
end