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
require 'logger'

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('./blog')
Nesta::Env.root = ::File.expand_path('./blog')

set :environment, :development
disable :run

require 'nesta/app'

#create a rack app
app = Rack::Builder.new do
  enable :logging, :dump_errors, :raise_errors
  set :show_exceptions, true if development?
  logger = ::File.open('log/development.log', 'a+')
  puts "HELLO WORLD"
  puts development?

  Nesta::App.use Rack::CommonLogger, logger
  Site.use Rack::CommonLogger, logger

  map '/blog' do
    run Nesta::App
  end

  #map all the other requests to sinatra
  map '/' do
    run Site
  end
end.to_app


run app
