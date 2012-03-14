#require './site'
#run Sinatra::Application

# A simple example of mounting multiple Sinatra apps in config.ru
# MODIFIED: uses Rack::Cascade

# To run this example:
#   1. put this code in a config.ru file
#   2. run "shotgun" on the command line (http://github.com/rtomayko/shotgun)
#   3. go to http://localhost:9393/

require 'sinatra/base'
require './site'

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('./blog')

require 'nesta/app'

run Rack::Cascade.new [Site, Nesta::App]
