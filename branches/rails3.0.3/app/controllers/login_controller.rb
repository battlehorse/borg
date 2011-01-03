class LoginController < ApplicationController
  
  def index
    @jumpto = params[:jumpto] || root_path
    redirect_to root_path if session[:user_id]
  end
  
  def login
    session[:jumpto] ||= params[:jumpto]
    if using_open_id?
      authenticate
    else
      flash[:error] = "You must provide an OpenID URL"
      redirect_to :action => "index"
    end
  end
  
  def logout
    @jumpto = params[:jumpto] || root_path
    session[:user_id] = nil
    render :layout => false
  end
  
  protected
  
  def authenticate(identity_url = "")
    authenticate_with_open_id(
    params[:openid_url], :required => [:nickname, :email ], :optional => [:fullname]) do 
      |result, identity_url, registration|
      
      if result.successful?
        @user = User.new
        @user.identity_url = identity_url
        @user.nickname = registration["nickname"]
        @user.email = registration["email"]
        @user.fullname = registration["fullname"]
        session[:user_id] = @user
        
        jumpto = session[:jumpto] || root_url
        session[:jumpto] = nil
        redirect_to(jumpto)
      else
        flash[:error] = result.message
        redirect_to :action => "index"
      end
    end
  end  

  
end