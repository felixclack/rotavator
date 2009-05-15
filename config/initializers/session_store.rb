# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rotavator_session',
  :secret      => 'dc94ea7a567f5f128a415f719d485ae8c8dc95e91a5a2746120b37e6d182becf179c06617b40782891b5a9d14cda2289511b88acb973775c1ce20747312cb7ee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
