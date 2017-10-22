### Common rails commands ENV Production

- RAILS_ENV=production rails db:create
- RAILS_ENV=production rake db:migrate
- RAILS_ENV=production rails db:seed
- rake assets:clobber RAILS_ENV=production
- rails c -e production
- rake assets:precompile RAILS_ENV=production
- sudo restart puma-manager
- sudo apt-get install mysql-server
- mysql -u root -p
- apt-get install libmysqlclient-dev
- sudo apt-get install libmysqlclient-dev
- sudo service nginx restart
- history >> 8172017history.txt
- sudo vi /etc/nginx/sites-available/default
- sudo nginx -t (will tell you if your current config is valid w/o errors)
- du -bsh *
- openssl x509 -noout -modulus -in ca_bundle.crt | openssl md5
- openssl rsa -noout -modulus -in private.key | openssl md5
- openssl dhparam -out dhparam.pem 4096 (created and added extra security layer to SSL Encryption)
- echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
- spring start
- spring stop
- nginx -v
- netstat -nlp | grep 80 (check to see if anything is on port 80 already)


### Previous PostgreSQL DB Dump

- pg_dump -h localhost -U samwholst portfolio_production > dbbackup92617.pgsql
- sudo vim /etc/postgresql/9.3/main/pg_hba.conf (change md5 to peer)


### /home/ubuntu puma.conf & puma-manger.conf

In /home/ubuntu folder
- wget https://raw.githubusercontent.com/puma/puma/master/tools/jungle/upstart/puma-manager.conf
- wget https://raw.githubusercontent.com/puma/puma/master/tools/jungle/upstart/puma.conf
- vi puma.conf
- sudo cp puma.conf puma-manager.conf /etc/init

```plaintext
# /etc/init/puma.conf - Puma config

# This example config should work with Ubuntu 12.04+.  It
# allows you to manage multiple Puma instances with
# Upstart, Ubuntu's native service management tool.
#
# See puma-manager.conf for how to manage all Puma instances at once.
#
# Save this config as /etc/init/puma.conf then manage puma with:
#   sudo start puma app=PATH_TO_APP
#   sudo stop puma app=PATH_TO_APP
#   sudo status puma app=PATH_TO_APP
#
# or use the service command:
#   sudo service puma {start,stop,restart,status}
#

description "Puma Background Worker"

# no "start on", we don't want to automatically start
stop on (stopping puma-manager or runlevel [06])

# change apps to match your deployment user if you want to use this as a less privileged user (recommended!)
setuid ubuntu
setgid ubuntu

respawn
respawn limit 3 30

instance ${app}

script
# this script runs in /bin/sh by default
# respawn as bash so we can source in rbenv/rvm
# quoted heredoc to tell /bin/sh not to interpret
# variables

# source ENV variables manually as Upstart doesn't, eg:
#. /etc/environment

exec /bin/bash <<'EOT'
  # set HOME to the setuid user's home, there doesn't seem to be a better, portable way
  export HOME="$(eval echo ~$(id -un))"

  if [ -d "/usr/local/rbenv/bin" ]; then
    export PATH="/usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH"
  elif [ -d "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
  elif [ -f  /etc/profile.d/rvm.sh ]; then
    source /etc/profile.d/rvm.sh
  elif [ -f /usr/local/rvm/scripts/rvm ]; then
    source /etc/profile.d/rvm.sh
  elif [ -f "$HOME/.rvm/scripts/rvm" ]; then
    source "$HOME/.rvm/scripts/rvm"
  elif [ -f /usr/local/share/chruby/chruby.sh ]; then
    source /usr/local/share/chruby/chruby.sh
    if [ -f /usr/local/share/chruby/auto.sh ]; then
      source /usr/local/share/chruby/auto.sh
    fi
    # if you aren't using auto, set your version here
    # chruby 2.0.0
  fi


  cd $app
  logger -t puma "Starting server: $app"

  exec bundle exec puma -C config/puma.rb
EOT
end script
```

```plaintext
# /etc/init/puma-manager.conf - manage a set of Pumas

# This example config should work with Ubuntu 12.04+.  It
# allows you to manage multiple Puma instances with
# Upstart, Ubuntu's native service management tool.
#
# See puma.conf for how to manage a single Puma instance.
#
# Use "stop puma-manager" to stop all Puma instances.
# Use "start puma-manager" to start all instances.
# Use "restart puma-manager" to restart all instances.
# Crazy, right?
#

description "Manages the set of puma processes"

# This starts upon bootup and stops on shutdown
start on runlevel [2345]
stop on runlevel [06]

# Set this to the number of Puma processes you want
# to run on this machine
env PUMA_CONF="/etc/puma.conf"

pre-start script
  for i in `cat $PUMA_CONF`; do
    app=`echo $i | cut -d , -f 1`
    logger -t "puma-manager" "Starting $app"
    start puma app=$app
  done
end script
```


### Puma.rb

In main app folder
- mkdir -p shared/pids shared/sockets shared/log

```ruby
# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory. If you use this option
# you need to make sure to reconnect any threads in the `on_worker_boot`
# block.
#
# preload_app!

# If you are preloading your application and using Active Record, it's
# recommended that you close any connections to the database before workers
# are forked to prevent connection leakage.
#
# before_fork do
#   ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
# end

# The code in the `on_worker_boot` will be called if you are using
# clustered mode by specifying a number of `workers`. After each worker
# process is booted, this block will be run. If you are using the `preload_app!`
# option, you will want to use this block to reconnect to any threads
# or connections that may have been created at application boot, as Ruby
# cannot share connections between processes.
#
# on_worker_boot do
#   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
# end
#

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Change to match your CPU core count
workers 1

# Min and Max threads per worker
threads 1, 6

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Default to production
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
activate_control_app

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
end
```

### Production.rb

```ruby
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
  # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
  # `config/secrets.yml.key`.
  config.read_encrypted_secrets = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "portfolio_#{Rails.env}"
  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Disable Rails's static asset server (Apache or nginx will already do this)
  # config.serve_static_assets = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  # config.assets.digest = true

  # config.assets.precompile += %w(app/assets/images/*)
  # config.assets.precompile += %w(app/assets/stylesheets/*)
  # config.assets.precompile += %w(app/assets/javascripts/*)

  # For Devise, set localhost to YOUR DOMAIN on the actual server
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  config.action_mailer.perform_deliveries = true

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    # :domain => "www.samwholst.com",
    :user_name => ENV.fetch('GMAIL_USERNAME2'),
    :password => ENV.fetch('GMAIL_PASSWORD2'),
    :authentication => "plain",
    :enable_starttls_auto => true
  }

  #config.action_cable.allowed_request_origins = [/http:\/\/*/, /https:\/\/*/]
  config.action_cable.allowed_request_origins = ['https://www.samwholst.com', 'http://www.samwholst.com']
  config.action_cable.url = "wss://www.samwholst.com/cable"

  # Force cookies to be over ssl
  config.force_ssl = true
end
```


### Cable.yml

```ruby
development:
  adapter: async

test:
  adapter: async

production:
  adapter: redis
  url: ENV.fetch('REDIS_CLOUD')
  #url: redis://redis:6379
  #channel_prefix: portfolio_production
```


### Appliation.rb

```ruby
require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "dotenv"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Portfolio
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # For the social media twitter module
    config.eager_load_paths << "#{Rails.root}/lib"
    config.assets.precompile += %w( ckeditor/* )
    config.secret_key_base = ENV["SECRET_KEY_BASE"]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Overrides all .permit require fields in the controllers
    #config.action_controller.permit_all_parameters = true
  end
end
```


### sudo vi /etc/nginx/sites-available/default 

```plaintext
upstream app {
 server unix:/home/ubuntu/portfolio/shared/sockets/puma.sock fail_timeout=0;
}

server {
listen 80;
server_name samwholst.com www.samwholst.com;
return 301 https://www.samwholst.com$request_uri;
}

server {
listen 443;
server_name samwholst.com www.samwholst.com;

ssl on;
ssl_certificate /home/ubuntu/ssl_certs/samwholst.chained.crt;
ssl_certificate_key /home/ubuntu/ssl_certs/private.key;
ssl_protocols TLSv1.1 TLSv1.2 TLSv1;
ssl_prefer_server_ciphers on;
ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK';
ssl_session_cache shared:SSL:10m;
ssl_session_timeout 10m;
ssl_dhparam /home/ubuntu/ssl_certs/dhparam.pem;

root /home/ubuntu/portfolio/public;

try_files $uri/index.html $uri @app;

location @app {
proxy_pass http://app;
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Host $host:443;
proxy_set_header X-Forwarded-Server $host;
proxy_set_header X-Forwarded-Port 443;
proxy_set_header X-Forwarded-Proto https;
}

location /cable {
proxy_pass http://app;
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection "Upgrade";
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header Host $http_host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-Proto https;
proxy_redirect off;
}

error_page 500 502 503 504 /500.html;
client_max_body_size 4G;
keepalive_timeout 10;
}
```









##########################################
Last login: Sat Oct 21 11:52:03 on ttys001
Welcome to Ubuntu 14.04.5 LTS (GNU/Linux 3.13.0-125-generic x86_64)

 * Documentation:  https://help.ubuntu.com/

  System information as of Sat Oct 21 08:01:10 UTC 2017

  System load:  0.0               Processes:           112
  Usage of /:   24.4% of 7.74GB   Users logged in:     0
  Memory usage: 29%               IP address for eth0: 172.31.19.74
  Swap usage:   0%

  Graph this data and manage this system at:
    https://landscape.canonical.com/

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

54 packages can be updated.
37 updates are security updates.


Last login: Sat Oct 21 08:01:11 2017 from c-73-228-66-251.hsd1.ut.comcast.net
ubuntu@ip-172-31-19-74:~$ history
    1  vi config/puma.rb
    2  mkdir -p shared/pids shared/sockets shared/log
    3  cd ~
    4  wget https://raw.githubusercontent.com/puma/puma/master/tools/jungle/upstart/puma-manager.conf
    5  wget https://raw.githubusercontent.com/puma/puma/master/tools/jungle/upstart/puma.conf
    6  vi puma.conf
    7  sudo cp puma.conf puma-manager.conf /etc/init
    8  sudo vi /etc/puma.conf
    9  sudo start puma-manager
   10  sudo apt-get install nginx
   11  sudo vi /etc/nginx/sites-available/default
   12  sudo service nginx restart
   13  sudo vi /etc/nginx/sites-available/default
   14  sudo vi /etc/nginx/sites-available/default
   15  sudo service nginx restart
   16  sudo vi /etc/nginx/sites-available/default
   17  sudo service nginx restart
   18  cd portfolio/
   19  vi config/environments/production.rb 
   20  vi config/environments/production.rb 
   21  sudo service nginx restart
   22  sudo vi /etc/nginx/sites-available/default
   23  sudo service nginx restart
   24  sudo vi /etc/nginx/sites-available/default
   25  sudo service nginx restart
   26  logout
   27  cd portfolio/
   28  sudo vi /etc/nginx/sites-available/default
   29  sudo service nginx restart
   30  sudo vi /etc/nginx/sites-available/default
   31  sudo service nginx restart
   32  sudo vi /etc/nginx/sites-available/default
   33  logout
   34  cd portfolio/
   35  cd ..
   36  history
   37  history >> history8102017.txt
   38  ls
   39  cd portfolio/
   40  vi config/puma.rb 
   41  git pull
   42  git stash
   43  git pull
   44  sudo service nginx restart
   45  git pull
   46  sudo service nginx restart
   47  logout
   48  sudo reboot
   49  sudo vi /etc/nginx/sites-available/default
   50  cd portfolio/
   51  vi config/environments/production.rb 
   52  sudo vi /etc/nginx/sites-available/default
   53  sudo service nginx restart
   54  sudo vi /etc/nginx/sites-available/default
   55  sudo vi /etc/nginx/sites-available/default
   56  sudo service nginx restart
   57  sudo vi /etc/nginx/sites-available/default
   58  sudo service nginx restart
   59  sudo vi /etc/nginx/sites-available/default
   60  sudo service nginx restart
   61  sudo vi /etc/nginx/sites-available/default
   62  vi config/environments/production.rb 
   63  vi config/cable.yml 
   64  sudo vi /etc/nginx/sites-available/default
   65  sudo service nginx restart
   66  netstat -nlp | grep 80
   67  netstat -nlp | grep 443
   68  netstat -nlp | grep 3000
   69  netstat -nlp | grep 3001
   70  netstat -nlp | grep 3000
   71  whereis nginx
   72  nginx -t
   73  sudo nginx -t
   74  sudo vi /etc/nginx/sites-available/default
   75  sudo service nginx restart
   76  sudo vi /etc/nginx/sites-available/default
   77  sudo service nginx restart
   78  nginx -v
   79  sudo nginx -t
   80  sudo vi /etc/nginx/sites-available/default
   81  sudo service nginx restart
   82  sudo vi /etc/nginx/sites-available/default
   83  sudo reboot
   84  sudo vi /etc/nginx/sites-available/default
   85  sudo reboot
   86  sudo vi /etc/nginx/sites-available/default
   87  sudo service nginx restart
   88  sudo vi /etc/nginx/sites-available/default
   89  sudo service nginx restart
   90  nginx -t
   91  sudo nginx -t
   92  sudo vi /etc/nginx/sites-available/default
   93  sudo nginx -t
   94  sudo vi /etc/nginx/sites-available/default
   95  sudo nginx -t
   96  sudo vi /etc/nginx/sites-available/default
   97  sudo vi /etc/nginx/sites-available/default
   98  sudo nginx -t
   99  sudo vi /etc/nginx/sites-available/default
  100  sudo nginx -t
  101  sudo service nginx restart
  102  sudo vi /etc/nginx/sites-available/default
  103  sudo nginx -t
  104  sudo vi /etc/nginx/sites-available/default
  105  sudo nginx -t
  106  sudo vi /etc/nginx/sites-available/default
  107  sudo nginx -t
  108  sudo vi /etc/nginx/sites-available/default
  109  sudo nginx -t
  110  sudo service nginx restart
  111  cd portfolio/
  112  vi config/environments/production.rb 
  113  sudo vi /etc/nginx/sites-available/default
  114  sudo service nginx restart
  115  vi config/environments/production.rb 
  116  touch tmp/restart.txt
  117  sudo service nginx restart
  118  sudo start puma-manager
  119  sudo restart puma-manager
  120  sudo vi /etc/nginx/sites-available/default
  121  sudo nginx -t
  122  sudo vi /etc/nginx/sites-available/default
  123  sudo nginx -t
  124  sudo vi /etc/nginx/sites-available/default
  125  sudo vi /etc/nginx/sites-available/default
  126  sudo nginx -t
  127  sudo vi /etc/nginx/sites-available/default
  128  vi config/environments/production.rb 
  129  sudo restart puma-manager
  130  vi config/environments/production.rb 
  131  sudo vi /etc/nginx/sites-available/default
  132  sudo nginx -t
  133  sudo vi /etc/nginx/sites-available/default
  134  sudo nginx -t
  135  sudo vi /etc/nginx/sites-available/default
  136  sudo nginx -t
  137  sudo vi /etc/nginx/sites-available/default
  138  sudo nginx -t
  139  sudo vi /etc/nginx/sites-available/default
  140  sudo nginx -t
  141  sudo vi /etc/nginx/sites-available/default
  142  sudo nginx -t
  143  sudo restart puma-manager
  144  sudo service nginx restart
  145  logout
  146  sudo vi /etc/nginx/sites-available/default
  147  sudo nginx -t
  148  sudo service nginx restart
  149  sudo restart puma-manager
  150  sudo vi /etc/nginx/sites-available/default
  151  sudo nginx -t
  152  sudo service nginx restart
  153  sudo restart puma-manager
  154  git pull
  155  cd portfolio/
  156  git pull
  157  vi config/environments/production.rb 
  158  sudo restart puma-manager
  159  sudo vi /etc/nginx/sites-available/default
  160  sudo nginx -t
  161  sudo service nginx restart
  162  sudo restart puma-manager
  163  vi config/environments/production.rb 
  164  sudo vi /etc/nginx/sites-available/default
  165  sudo nginx -t
  166  sudo vi /etc/nginx/sites-available/default
  167  sudo nginx -t
  168  sudo service nginx restart
  169  sudo restart puma-manager
  170  sudo vi /etc/nginx/sites-available/default
  171  sudo nginx -t
  172  sudo service nginx restart
  173  sudo restart puma-manager
  174  vi config/environments/production.rb 
  175  sudo service nginx restart
  176  sudo restart puma-manager
  177  vi config/environments/production.rb 
  178  sudo restart puma-manager
  179  sudo service nginx restart
  180  sudo vi /etc/nginx/sites-available/default
  181  sudo nginx -t
  182  sudo service nginx restart
  183  sudo restart puma-manager
  184  sudo vi /etc/nginx/sites-available/default
  185  sudo nginx -t
  186  sudo vi /etc/nginx/sites-available/default
  187  sudo nginx -t
  188  sudo restart puma-manager
  189  sudo service nginx restart
  190  sudo vi /etc/nginx/sites-available/default
  191  sudo nginx -t
  192  sudo service nginx restart
  193  sudo restart puma-manager
  194  sudo vi /etc/nginx/sites-available/default
  195  git pull
  196  histroy | grep precomp
  197  history | grep precomp
  198  rake assets:precompile RAILS_ENV=production
  199  rake assets:clobber RAILS_ENV=production
  200  rake assets:precompile RAILS_ENV=production
  201  spring stop
  202  spring status
  203  sudo service nginx restart
  204  sudo restart puma-manager
  205  sudo service nginx restart
  206  spring start
  207  spring status
  208  vi config/environments/production.rb 
  209  sudo vi /etc/nginx/sites-available/default
  210  sudo service nginx restart
  211  sudo restart puma-manager
  212  vio config/puma.rb 
  213  vi config/puma.rb 
  214  bundle exec
  215  bundle
  216  vi config/cable.yml 
  217  sudo restart puma-manager
  218  sudo service nginx restart
  219  vi config/cable.yml 
  220  sudo restart puma-manager
  221  sudo service nginx restart
  222  sudo vi /etc/nginx/sites-available/default
  223  sudo service nginx restart
  224  sudo restart puma-manager
  225  rails c -e env
  226  rails c
  227  vio config/environments/production.rb 
  228  vi config/environments/production.rb 
  229  rails c -e production
  230  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  231  rails c -e production
  232  sudo vi /etc/nginx/sites-available/default
  233  logout
  234  vi config/environments/production.rb 
  235  cd portfolio/
  236  vi config/environments/production.rb 
  237  vi config/cable.yml 
  238  vi config/application.rb 
  239  sudo vi /etc/nginx/sites-available/default
  240  logout
  241  cdport
  242  cd 
  243  cd portfolio/
  244  git pull
  245  logout
  246  cd portfolio/
  247  git pull
  248  rake assets:precompile RAILS_ENV=production
  249  sudo service nginx restart
  250  sudo restart puma-manager
  251  git pull
  252  rake assets:precompile RAILS_ENV=production
  253  sudo service nginx restart
  254  sudo restart puma-manager
  255  cd ..
  256  history | grep ex
  257  pg_dump -U samwholst portfolio_production > dbbackup812.pgsql
  258  pg_dump -h localhost -U samwholst portfolio_production > dbbackup812.pgsql
  259  logout
  260  cd portfolio/
  261  git pull
  262  rake assets:precompile RAILS_ENV=production
  263  sudo restart puma-manager
  264  cd ..
  265  pg_dump -h localhost -U samwholst portfolio_production > dbbackup812.pgsql
  266  logout
  267  sudo restart puma-manager
  268  logout
  269  cd portfolio/
  270  vi config/environments/production.rb 
  271  git pull
  272  bundle
  273  rake assets:precompile RAILS_ENV=production
  274  sudo restart puma-manager
  275  git pull
  276  rake assets:precompile RAILS_ENV=production
  277  sudo restart puma-manager
  278  git pull
  279  rake assets:precompile RAILS_ENV=production
  280  sudo restart puma-manager
  281  logout
  282  pg_dump -h localhost -U samwholst portfolio_production > dbbackup813.pgsql
  283  logout
  284  pg_dump -h localhost -U samwholst portfolio_production > dbbackup815.pgsql
  285  sudo vi /etc/nginx/sites-available/default
  286  sudo nginx -t
  287  sudo service nginx restart
  288  sudo vi /etc/nginx/sites-available/default
  289  sudo nginx -t
  290  sudo vi /etc/nginx/sites-available/default
  291  sudo nginx -t
  292  sudo vi /etc/nginx/sites-available/default
  293  sudo nginx -t
  294  sudo vi /etc/nginx/sites-available/default
  295  sudo nginx -t
  296  sudo vi /etc/nginx/sites-available/default
  297  sudo nginx -t
  298  ls
  299  cd ssl_certs/
  300  ls
  301  openssl x509 -noout -modulus -in ca_bundle.crt | openssl md5
  302  openssl rsa -noout -modulus -in private.key | openssl md5
  303  ls
  304  sudo nginx -t
  305  sudo vi /etc/nginx/sites-available/default
  306  logout
  307  sudo service nginx restart
  308  logout
  309  sudo vi /etc/nginx/sites-available/default
  310  sudo nginx -t
  311  sudo service nginx restart
  312  sudo vi /etc/nginx/sites-available/default
  313  sudo nginx -t
  314  sudo service nginx restart
  315  sudo vi /etc/nginx/sites-available/default
  316  sudo nginx -t
  317  sudo vi /etc/nginx/sites-available/default
  318  sudo nginx -t
  319  sudo vi /etc/nginx/sites-available/default
  320  sudo nginx -t
  321  sudo service nginx restart
  322  sudo vi /etc/nginx/sites-available/default
  323  logout
  324  sudo vi /etc/nginx/sites-available/default
  325  sudo nginx -t
  326  sudo service nginx restart
  327  sudo vi /etc/nginx/sites-available/default
  328  sudo nginx -t
  329  sudo service nginx restart
  330  sudo restart puma-manager
  331  cd ssl_certs/
  332  openssl dhparam -out dhparam.pem 4096
  333  ls
  334  ls -l
  335  ls -al
  336  du -bsh *
  337  sudo vi /etc/nginx/sites-available/default
  338  sudo nginx -t
  339  sudo service nginx restart
  340  sudo restart puma-manager
  341  sudo vi /etc/nginx/sites-available/default
  342  logout
  343  cd portfolio/
  344  git pull
  345  git stash
  346  git pull
  347  rake assets:precompile RAILS_ENV=production
  348  sudo restart puma-manager
  349  cd ..
  350  history >> 8172017history.txt
  351  logout
  352  cd portfolio/
  353  git pull
  354  rake assets:precompile RAILS_ENV=production
  355  sudo restart puma-manager
  356  logout
  357  pg_dump -h localhost -U samwholst portfolio_production > dbbackup82417.pgsql
  358  logout
  359  cd portfolio/
  360  git pull
  361  sudo restart puma-manager
  362  sudo service nginx restart
  363  git pull
  364  sudo restart puma-manager
  365  cd ..
  366  pg_dump -h localhost -U samwholst portfolio_production > dbbackup82417.pgsql
  367  pg_dump -h localhost -U samwholst portfolio_production > dbbackup82417.pgsql
  368  pg_dump -h localhost -U samwholst portfolio_production > dbbackup82417.pgsql
  369  logout
  370  pg_dump -h localhost -U samwholst portfolio_production > dbbackup82417.pgsql
  371  logout
  372  cd portfolio/
  373  rails c
  374  rails c -e production
  375  history
  376  vim /var/lib/pgsql/9.3/data/pg_hba.conf
  377  cd /var/lib/pgsql
  378  cd /var/lib
  379  ls
  380  cd postgresql/
  381  ls
  382  cd 9.3/
  383  ls
  384  cd main/
  385  sudo cd main/
  386  ls main/
  387  history | pg_hba
  388  history | grep pg_hba
  389  sudo vim /etc/postgresql/9.3/main/pg_hba.conf
  390  cd portfolio/
  391  rails c
  392  sudo vim /etc/postgresql/9.3/main/pg_hba.conf
  393  logout
  394  cd portfolio/
  395  ls
  396  rails c
  397  rails c -e production
  398  logout
  399  cd portfolio/
  400  git pull
  401  rails db:migrate
  402  bundle
  403  rails db:migrate
  404  history
  405  history | grep migrate
  406  RAILS_ENV=production rake db:migrate
  407  rake assets:precompile RAILS_ENV=production
  408  sudo restart puma-manager
  409  logout
  410  cd portfolio/
  411  git pull
  412  git pull
  413  rake assets:precompile RAILS_ENV=production
  414  sudo restart puma-manager
  415  logout
  416  pg_dump -h localhost -U samwholst portfolio_production > dbbackup92617.pgsql
  417  pg_dump -h localhost -U samwholst portfolio_production > dbbackup92617.pgsql
  418  logout
  419  ls
  420  sudo apt-get install mysql-server
  421  mysql -u root -p
  422  mysql -u root -p
  423  cdport
  424  cd portfolio/
  425  ls
  426  git pull
  427  bundle
  428  apt-get install libmysqlclient-dev
  429  sudo apt-get install libmysqlclient-dev
  430  bundle
  431  rails db:setup
  432  sudo restart puma-manager
  433  RAILS_ENV=production rails db:create
  434  sudo restart puma-manager
  435  RAILS_ENV=production rails db:seed
  436  sudo restart puma-manager
  437  logout
  438  cd port
  439  history
  440  cd portfolio/
  441  git pull
  442  rake assets:precompile RAILS_ENV=production
  443  sudo restart puma-manager
  444  git pull
  445  rake assets:precompile RAILS_ENV=production
  446  sudo restart puma-manager
  447  git pull
  448  git pull
  449  rake assets:precompile RAILS_ENV=production
  450  sudo restart puma-manager
  451  git pull
  452  logout
  453  cd portfolio/
  454  git pull
  455  git pull
  456  rake assets:precompile RAILS_ENV=production
  457  sudo restart puma-manager
  458  logout
  459  cd portfolio/
  460  git pull
  461  git pull
  462  sudo restart puma-manager
  463  logout
  464  cd port
  465  cdp or
  466  cd portfolio/
  467  git pull
  468  logout
  469  git portfolio/
  470  git pull
  471  cd portfolio/
  472  git pull
  473  sudo restart puma-manager
  474  logout
  475  git portfolio/
  476  cd portfolio/
  477  git pull
  478  rake assets:precompile RAILS_ENV=production
  479  reboot
  480  sudo reboot
  481  cd portfolio/
  482  git pull
  483  rake assets:precompile RAILS_ENV=production
  484  git pull
  485  rake assets:precompile RAILS_ENV=production
  486  sudo restart puma-manager
  487  logout
  488  cd portfolio/
  489  git pull
  490  git pull
  491  cd portfolio/
  492  git pull
  493  git stash
  494  git pull
  495  bundle
  496  rake assets:precompile RAILS_ENV=production
  497  sudo restart puma-manager
