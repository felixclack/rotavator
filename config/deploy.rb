set :application, "rotavator"
set :domain, "rotavatorapp.com"
set :deploy_to, "/var/www/#{application}"

set :image_id, "ami-51709438" #Ubuntu Hardy
set :instance_id, "i-89b30ce0"
set :instance_url, "ec2-67-202-58-66.compute-1.amazonaws.com"
#set :instance_ip, ""
#static IP 75.101.144.145

set :application, "evidence"
set :repository,  "git@github.com:kid80/rotavator.git"
set :scm, "git"
set :scm_passphrase, "saffron" # Public key passphrase
set :user, "root"
set :branch, "master"
#set :deploy_via, :remote_cache

role :app, instance_url
role :web, instance_url
role :db,  instance_url, :primary => true

set :username, "root"
set :keypair, "gsg-keypair"
set :ec2_dir, ENV['HOME'] + '/.ec2'
set :keypair_full_path, "#{ec2_dir}/id_rsa-#{keypair}" if respond_to?(:keypair)
set :account_id, "5863-6034-5219"
set :access_key_id, "0AB62M2DVTV657PANG82"
set :secret_access_key, "zh6QxIzUwRz5WSKNTJBQ6gCH4ysn2ROPd/6pI1Bq"
set :pk, "pk-YEBLQHNIG36KTF73YJWCIH7VI5RRKL2Q.pem"
set :cert, "cert-YEBLQHNIG36KTF73YJWCIH7VI5RRKL2Q.pem"

role :app, instance_url
role :web, instance_url
role :db,  instance_url, :primary => true

require 'dwell'

# Application Details
set :application, "myapp"
set :domain,      "myapp.com"
set :repository,  "svn://myapp.com/trunk"

## the user to use when creating new databases and such
# set :mysql_admin, "root"

## hosts to automatically add to ssh known_hosts for your deploy user
## only github is currently supported
set :known_hosts, [:github]

## other dwell packages to install on this server
# set :dwell_install, ["imagemagick"]

## a specific rails version your app depends on, will be
## gem installed during dwell:install
# set :rails_gem_version, "=2.1.2"

## uncomment this to use enterprise ruby, default is the system ruby
set :which_ruby, :enterprise

## passenger

# set :passenger_use_global_queue, "off"
# set :passenger_pool_idle_time, 300
# set :passenger_rails_spawn_method, "smart"
# set :passenger_max_instances_per_app, 0
# set :passenger_max_pool_size, 6


## apache

# set :apache_server_name, nil
# set :apache_default_vhost, false
# set :apache_ctl, "/etc/init.d/apache2"
# set :apache_server_aliases, ["otherhostname.com","alias.net"]
# set :apache_ssl_enabled, false
# set :apache_ssl_ip, "*"
# set :apache_ssl_forward_all, false

ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa-gsg-keypair")]