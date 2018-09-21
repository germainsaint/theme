require 'twilio-ruby'
class TwilioController < ApplicationController

skip_before_action :verify_authenticity_token

 def send_message
 	account_sid = 'AC9321f58ad4774b475918f1ae0f626f82'
	auth_token = 'd6d5517d1fc4ea8c0bbb31386847b409'
	client = Twilio::REST::Client.new(account_sid, auth_token)

	from = '+14752340065' # Your Twilio number
	to = '+919541555660' # Your mobile phone number
	result = client.messages.create(
	from: from,
	to: to,
	body: "This is the new Send form vidur!"
	)
	puts result
 end	
end
