require "Mechanize"
require "rubygems"

require 'twilio-ruby'
require 'twitter'

@Twitterclient = Twitter::REST::Client.new do |config|
  config.consumer_key        = "WYHErBSrRLaMb5nhoR8guDT3o"
  config.consumer_secret     = "SZ65SKDOcKlxRMp0yVHT3ewedOxAipLq5xzwvRSqj2HX0lDAfW"
  config.access_token        = "484381280-c82AZlqBOIFawMZcnTxSSWELeN1vFm4ICB8L12dj"
  config.access_token_secret = "1xpJGQsOyfMe59AV6LnLfCoE95D40UORdfMYh9g36umfe"
end

account_sid = 'ACefa5598e8fab15ccaaa582119f8fd2d5'
auth_token = '4cc250ee8cfe552381dc163e970a3705'
@client = Twilio::REST::Client.new account_sid, auth_token
receivePhone ="+17736284972"
@SendPhone = "+17088872036"



def sendMsg(phone, fText)
	@client.messages.create(
	  from: @SendPhone,
	  to: phone,
	  body: fText
	)
end

def TwitterTruncate(msg)
	return msg[0..139].gsub(/\s\w+$/,'...')
end


def tweet(msg)
	@Twitterclient.update(TwitterTruncate(msg))
end



Agent = Mechanize.new
Agent.user_agent_alias = "Mac Safari"
page = Agent.get ("http://www.amazon.com")

search_form = page.form

print "What do you want to search Amazon for? "
searchText = gets.chomp.delete(",")

search_form['field-keywords'] = searchText
page = search_form.submit

items = page.css(".s-result-item")
$i = 1
items.each do |item|
	$i += 1
	temptext = item.css('h2').text + " -- " + item.css('.s-price').text
	puts temptext# print your message in terminal
	sendMsg(receivePhone, temptext)	#use twilio to send message to your phone number // change the receive phone number
	tweet(temptext)	 # also tweet the message
end while $i < 10

