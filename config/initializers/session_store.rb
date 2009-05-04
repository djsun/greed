# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_greed_session',
  :secret      => 'e02ce018ab6fb778b5eec7125f42df1d0838b45df94b189057e71eea0f980f62be49a582b65958a4c5569328b65581ec4267cab808ee0724dac2869bc4c0ba9d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
