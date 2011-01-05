class SocialController < ApplicationController

  def buttons
    render :partial => 'buttons'
  end
  
  def retweet
    render :template => 'social/retweet.js.erb', :content_type => 'application/javascript'
  end

end