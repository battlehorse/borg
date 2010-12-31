# Borg variables here
BorgConfig = {
  # Site title
  :title => "Your Site",
  
  # Site tagline
  :tagline =>  "This is really your site",
  
  # Directory where all the pages are stored
  :data_dir => "/path/to/data/dir/",
  
  # DIrectory where all the comments are stored
  :comment_dir => "/path/to/comment/dir/",
  
  # CSS Template: 'InternetSharing', 'CoolWater', 'bigG',
  # NOTE: bigG is the only template currently supporting mobile devices:
  # iphone, ipod touch, android (nexus one).
  :css_template => "InternetSharing",  
  
  # DEFIMG url
  :default_img_url => "http://url.for.default.images",
  
  # Url for the contact link that appears on top of every page
  :contact_url => "http://url.for.the.contact.page",
  
  # List of editors. All the OpenID urls listed here will be able to edit pages.
  # Remember to put the whole URL, including the scheme part.
  # 
  # WARNING: Leaving this list empty will create an open website! Everybody will be able to edit.
  :editors => [ 'http://editor.openid' ],
  
  # Meta information about the site, that will be used to populate
  # HTML META tags on top of each page.
  :meta =>  {
    :author => 'Your Name - yourmail@domain.com',
    :robots => 'index,follow',
    :keywords => 'your, keywords',
    :description => 'your site description'
  },  
  
  # Domain to be searched from the search box (that uses google search)
  :search_domain => "yourdomain.com",
  
  # Google analytics account. Comment this line if you don't have any
  :google_analytics => "UA-123456-1",
  
  # Googla chatback. Paste here the content as generated from http://www.google.com/talk/service/badge/New, if you want to use it.
  # Note that Google chatback is not enabled when accessing the site from mobile devices.
  :google_chatback => ''
}