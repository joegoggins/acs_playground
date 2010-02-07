# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_acs_playground_session',
  :secret      => 'bfefca4fe10f411d21eac3f056a9928b4756ebebda7393abc9f95270c96bce80dd1be22b04a87d5728a18215cc28f9e7ae2d19c0b00bc413dd8899531ccec36e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
