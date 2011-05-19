# Borg variables here
BorgConfig = {
  # Site title
  :title => "Your Site",

  # Site tagline
  :tagline =>  "This is really your site",

  # Directory where all the pages are stored
  # Use https://github.com/battlehorse/borg-data-empty as a bootstrap
  :data_dir => "/path/to/data/dir/",

  # DIrectory where all the comments are stored
  # Use https://github.com/battlehorse/borg-data-empty as a bootstrap  
  :comment_dir => "/path/to/comment/dir/",

  # Directory where all the attachments are stored
  # Use https://github.com/battlehorse/borg-data-empty as a bootstrap  
  :attach_dir => "/path/to/attachments/dir/",

  # Maximum size of uploaded files (in bytes)
  :max_upload_size => 1 * 1024 * 1024,  # 1 Mb
  
  # URL prefix to serve attachments.
  # If empty, Rails will serve all attachments directly.
  # If defined (e.g.: http://static.yourhost.com/files/) the url prefix will be
  # prepended to all attachments links. 
  :attach_serving_url => '',  

  # CSS Template: 'InternetSharing', 'CoolWater', 'bigG',
  # NOTE: bigG is the only template currently supporting mobile devices:
  # iphone, ipod touch, android (nexus one, nexus S, Xoom).
  :css_template => "bigG",

  # DEFIMG url, used by the clipart system.
  :default_img_url => "http://url.for.default.images",
  
  # License information for your content. You can use here a raw HTML snippet
  # that will be placed in the footer of each site page.
  :license => (<<-heredoc
    <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">
      <img alt="Creative Commons License" style="border-width:0; vertical-align:text-bottom" 
           src="http://i.creativecommons.org/l/by-sa/3.0/80x15.png" /></a>
    heredoc
  ),  

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
  
  # Contents for the humans.txt file (see http://humanstxt.org/)
  :humans_txt => (<<-heredoc
    Put the contents of your humans.txt here.
    heredoc
  ),

  # Domain to be searched from the search box (that uses google search)
  :search_domain => "yourdomain.com",

  # Social buttons. Decide whether you want to have buttons for Google Buzz,
  # Facebook and Twitter at the end of every article.
  :social_buttons => {
    :enabled => true,  # set to false to disable social buttons altogether.

    # Optional: Twitter username that should appear as tweet source. Leave empty if unused.
    :retweet_via => ''
  },

  # Google analytics account. Comment this line if you don't have any
  :google_analytics => "UA-123456-1",

  # Google chatback. Paste here the content as generated from http://www.google.com/talk/service/badge/New, if you want to use it.
  # Note that Google chatback is not enabled when accessing the site from mobile devices.
  :google_chatback => '',
  
  # Whether to enable the Google translation widget or not.
  # See http://www.google.com/webelements/#show-translate
  :google_translate => {
    :enabled => true,
    :source_language => 'en'
  }
}
