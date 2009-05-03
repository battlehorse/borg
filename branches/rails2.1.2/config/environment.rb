# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  config.frameworks -= [ :active_record ]

  # Specify gems that this application depends on. 
  # I'd like to keep this statements, but they either generate warnings, or plainly fail.
  # I still have to understand why.
  # config.gem "RedCloth"
  # config.gem "ruby-openid", :version => '>= 2.0.4'
  # config.gem "rubytree"

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Uncomment to use default local time.
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_borg2_session',
    :secret      => 'cc477893ef7a449b5f02b89b9301a2a7f02a4a3f3290208b9da513c714d1241d3d823e3331fbb448748285b3c9358c9a294bfb3d21a7829c92d287b93616b708'
  }


  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
end

# store OpenId sessions to file instead of database
OpenIdAuthentication.store = :file

# Change this parameter if your application is being served from a subdomain
# ActionController::AbstractRequest.relative_url_root = "/subdomain"