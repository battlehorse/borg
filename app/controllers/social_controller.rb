class SocialController < ApplicationController

  def buttons
    render :partial => 'buttons'
  end
  
  def retweet
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

end