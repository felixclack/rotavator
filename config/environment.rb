RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'giraffesoft-resource_controller', :lib => 'resource_controller', :source => 'http://gems.github.com'
  config.gem 'authlogic'
  config.gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => 'http://gems.github.com'
  config.gem 'thoughtbot-shoulda', :lib => 'shoulda', :source => 'http://gems.github.com'
  config.gem 'jeremymcanally-matchy', :lib => 'matchy', :source => 'http://gems.github.com'
  config.gem 'jeremymcanally-stump', :lib => 'stump', :source => 'http://gems.github.com'
  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'haml'
  
  config.time_zone = 'London'
  config.action_controller.session = {
    :session_key => '_app_session',
    :secret      => '699dd6891315876f628d7db9cc2ce63f1ff83e5606001d5b53b702214b47bb7ecadb942c38c82697e5192e947dacfbcb74dd7b69c95bb9b32b255bcaee309c66'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  config.action_controller.session_store = :active_record_store
end