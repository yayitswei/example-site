require 'rubygems'
require 'sinatra'

MENU = [:home, :about, :work, :contact]
ROUTING = {:home => '/',
           :about => '/about',
           :work => '/work',
           :contact => '/contact'}

get '/' do
  erb :home
end

get '/about' do
  @name = 'Wei'

  @seconds_old = Time.now - Time.local(1984, 4, 20)
  @age = @seconds_old / 365.25 / 24 / 60 / 60
  erb :about
end

get '/work' do
  erb :work
end

get '/contact' do
  erb :contact
end

not_found do
  '404!'
end
