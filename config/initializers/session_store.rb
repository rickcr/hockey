# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hockey_session',
  :secret      => '275aeb72123c818323159af159ed70baa7fa37b3088568d7e149baf9b001a10f0a8b79d96f6d6173544eca3f908e56eeb3ea954581a5fd9c694baca0810cca53'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
