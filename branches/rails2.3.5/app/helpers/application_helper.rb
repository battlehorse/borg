require 'borg/util'

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include Borg::Util
  
  def author_link(page)
    author = page.author || page.author_mail || "unknown author"
    author_mail = page.author_mail
    
    if !author_mail.blank?
      link_to author , "mailto: #{author_mail}"
    else
      author
    end
  end
  
  def author_rss(page)
    author = page.author || page.author_mail || "unknown author"
    author_mail = page.author_mail

    if !author_mail.blank?
      "#{author_mail} (#{author})"
    else
      author
    end   
  end
  
  def last_modified(page)
    File.new(page.rpath).mtime.strftime("%b %e, %Y - %H:%M")
  end
  
  def last_modified_rss(page)
    File.new(page.rpath).mtime.to_s(:rfc822)
  end
  
  def strip_tags(content)
    content.gsub(/<\/?[^>]*>/, "")
  end
  
  def kind(obj)
    if obj.respond_to?(:date) && obj.respond_to?(:titleless_content) && obj.date && !obj.titleless_content.blank?
      :page_with_date
    elsif obj.respond_to?(:title) && !obj.title.blank?
      :page_with_title
    elsif obj.respond_to?(:content) && !obj.content.blank?
      :page
    else
      :generic
    end
  end

end
