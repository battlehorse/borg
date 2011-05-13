# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_borg2_session',
  :secret      => 'd3fc2681cb31f5006237e35971bb9c1d1cb5168a83ba4d061cb48a36896fd8ff3d99823c9f4ea99e7a24aacf91514ba0daa61513cfb30881dd7a65814dc1103c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
