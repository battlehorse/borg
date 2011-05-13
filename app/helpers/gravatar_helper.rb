require 'digest/md5'

module GravatarHelper
  
  def gravatar(email)
    digest = Digest::MD5.new.update(email.gsub(/ at /,"@").gsub(/ dot /,".").downcase)
    grav_url = "http://www.gravatar.com/avatar/#{digest}?s=60&r=g&d=wavatar"
  
    "<img src=\"#{grav_url}\" alt=\"#{email}\" class=\"articleimg float-right\" />".html_safe
  end
  
end