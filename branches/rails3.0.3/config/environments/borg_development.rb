# Borg variables here
BorgConfig = {
  # Site title
  :title => "Borg<span class='title'>!</span>",

  # Site tagline
  :tagline =>  "The Battlehorse ORGanizer",

  # Directory where all the pages are stored
  :data_dir => "/Users/battlehorse/Documents/Devel/ruby/rails/borg-data/data2/",

  # Directory where all the comments are stored
  :comment_dir => "/Users/battlehorse/Documents/Devel/ruby/rails/borg-data/comment2/",

  # Directory where all the attachments are stored
  :attach_dir => "/Users/battlehorse/Documents/Devel/ruby/rails/borg-data/attach2",

  # CSS Template: 'InternetSharing', 'CoolWater', 'bigG',
  # NOTE: bigG is the only template currently supporting mobile devices:
  # iphone, ipod touch, android (nexus one).
  :css_template => "bigG",

  # DEFIMG url
  :default_img_url => "http://www.battlehorse.net/defimg/",

  # Url for the contact link that appears on top of every page
  :contact_url => 'people/me/index.html',

  # List of editors. All the OpenID urls listed here will be able to edit pages.
  # Remember to put the whole URL, including the scheme part.
  #
  # WARNING: Leaving this list empty will create an open website! Everybody will be able to edit.
  :editors => [ 'http://battlehorse.pip.verisignlabs.com/' ],

  # Meta information about the site, that will be used to populate
  # HTML META tags on top of each page.
  :meta =>  {
    :author => 'Riccardo Govoni - battlehorse@gmail.com',
    :robots => 'index,follow',
    :keywords => 'information technology, user interface, web design, java, python, web standard, javascript',
    :description => 'Information architecture, Web Design, Web Standards.'
  },

  # Domain to be searched from the search box (that uses google search)
  :search_domain => "battlehorse.net",

  # Social buttons. Decide whether you want to have buttons for Google Buzz,
  # Facebook and Twitter at the end of every article.
  :social_buttons => {
    :enabled => true,  # set to false to disable social buttons altogether.

    # You must have a bit.ly account for Twitter buttons to work.
    :bitly_user => 'battlehorse',
    :bitly_key => 'R_8be71ae977df4b604fc092fb91167e90',

    # Optional: Prefix to use when retweeting (such as: 'RT @battlehorse ').
    # Page title and shortened url are already included in retweets.
    :retweet_prefix => 'RT @battlehorse '
  },

  # Google analytics account. Comment this line if you don't have any
  :google_analytics => "UA-328792-1",

  # Google chatback. Paste here the content as generated from http://www.google.com/talk/service/badge/New, if you want to use it.
  # Note that Google chatback is not enabled when accessing the site from mobile devices.
  :google_chatback => '<iframe src="http://www.google.com/talk/service/badge/Show?tk=z01q6amlqupsnbfd19tbnltt8g9cmv7rf2p4f3hec8vetl94b380jjo59a49n9rcss57af67g92gqgfd5nlb8ioq34dj0576avm0m6dr3l7k4vnqcgukudi2o1uotnfhegu5v3u1tmjvitvcsthpjeoacrr3u7gs1qjbrou9l&amp;w=159&amp;h=36" allowtransparency="true" frameborder="0" height="36" width="159"></iframe>'
}
