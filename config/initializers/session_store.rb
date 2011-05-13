# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_borg2_session',
  :secret      => '3e8ec6cfd13b0491c9a179c4be664e9a770bf23ca3bad221a7a35b4d5d257a05886fe915684a5029d6ed27775384da51b7d2153c3485bf8fd3ecbfb6b437e46d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
