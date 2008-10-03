#RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'London'
  config.action_controller.session = {
    :session_key => '_app_session',
    :secret      => '699dd6891315876f628d7db9cc2ce63f1ff83e5606001d5b53b702214b47bb7ecadb942c38c82697e5192e947dacfbcb74dd7b69c95bb9b32b255bcaee309c66'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  config.action_controller.session_store = :active_record_store
  config.active_record.observers = :user_observer
end