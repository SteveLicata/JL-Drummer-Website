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




# sendgrib API email/message setup
get '/home' do

  # set the from, subject and to addresses
  from    =   SendGrid::Email.new(email: @from_email)
  to      =   SendGrid::Email.new(email: 'jlambros81@gmail.com')
  subject =   @subject

  # set the content to send in the email
  content = SendGrid::Content.new(type: 'text/plain', value: @content)

  # set the mail attribute values
  mail = SendGrid::Mail.new(from, subject, to, content)

  # pass in the sendgrid api key
  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

  # send the email
  response = sg.client.mail._('send').post(request_body: mail.to_json)

  # display the response status code and body in terminal
  puts "STATUS CODE", response.status_code
  puts "", response.body

end # ends sendgrid email


get '/contact_me' do
  erb :contact_me
end

post '/send_dynamic_email' do

  puts params.inspects

#set variables to hold parameter data:
@from_email = params[:from_email]
@to_email = "jlambros81@gmail.com"
@email_subject = params[:email_subject]
@email_content = params[:email_content]

# set the 'from', 'subject' and 'to' addresses
from = SendGrid::Email.new(email: @from_email)
to = SendGrid::Email.new(email: @to_email)
subject = @email_subject

# set the content to send in the email
content =  SendGrid::Content.new(type: 'text/plain', value: @email_content)

# set the mail attribute values
mail = SendGrid::Mail.new(from, subject, to, content)

# pass in the sendgrid api key
sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

# send the email
response = sg.client.mail._('send').post(request_body: mail.to_json)

# display the response status code and body
puts "STATUS CODE:", response.status_code
puts "resonse.body:", response.body

  if response.status_code.to_i == 202
    redirect '/success'
  else
    redirect '/fail'
  end

end

get '/success' do
  erb :success
end

get '/fail' do
  "There was a problem and your request was not processed successfully...please try again."
end
