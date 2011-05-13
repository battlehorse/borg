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
      params[:openid_url], 
      :required => [:nickname, :email,  # sreg fields
                    "http://axschema.org/contact/email",
                    "http://axschema.org/namePerson/first",
                    "http://axschema.org/namePerson/last"], 
      :optional => [:fullname]) do 
        |result, identity_url, registration|

      if result.successful?
        sreg_response = registration
        ax_response = OpenID::AX::FetchResponse.from_success_response(
            request.env[Rack::OpenID::RESPONSE])
        
        @user = User.new
        @user.identity_url = identity_url        
        if ax_response
          @user.email = ax_response['http://axschema.org/contact/email'][0]
          @user.fullname = ax_response['http://axschema.org/namePerson/first'][0] + ' ' +
              ax_response['http://axschema.org/namePerson/last'][0]
        else
          @user.nickname = sreg_response["nickname"]
          @user.email = sreg_response["email"]
          @user.fullname = sreg_response["fullname"]
        end
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