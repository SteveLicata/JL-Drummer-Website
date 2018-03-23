require 'sinatra'
require 'sendgrid-ruby'

#localhost 4567

get '/' do
  erb :home
end

get '/bio' do
  erb :bio
end

get '/contact' do
  erb :contact
end

get '/photos' do
  erb :photos
end

get '/video' do
  erb :video
end
