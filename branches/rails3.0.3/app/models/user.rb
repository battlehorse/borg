require 'borg/util'

class User
  include Borg::Util

  attr_accessor :identity_url, :nickname, :email, :fullname
  
  def is_editor
    borg(:editors).include?(@identity_url) || borg(:editors).blank?
  end
  
  def to_author_hash
    { "author" => @fullname || @nickname, "author_mail" => @email }
  end
  
end