# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_devicehub_session',
  :secret      => '3563b2174740d295eb26bd84e2ba9c923cdfd52289254728c34ec77c6ed395be1ba946385ad6342196882796f392ef543a2059320c92f84cc69f0a3c0a8472d2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
