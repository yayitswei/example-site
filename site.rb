require 'rubygems'
require 'sinatra'

MENU = {:home => '/',
        :about => '/about',
        :work => '/work'}

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

not_found do
  '404!'
end
