require 'twilio-ruby'
require 'stock_quote'
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

stocks = ["FB", "BP", "C", "SCHW", "JPM"]

def getStockPrice (symbol)
	stockData = StockQuote::Stock.quote(symbol)
	return stockData
end 

def sendMsg(phone, fText)
	@client.messages.create(
	  from: @SendPhone,
	  to: phone,
	  body: fText
	)
end

def TwitterTruncate(msg)
	return msg[0..30].gsub(/\s\w+$/,'...')
end


def tweet(msg)
	@Twitterclient.update(TwitterTruncate(msg))
end

def twitterSearch(searchMsg)
	puts searchMsg
	@Twitterclient.search(searchMsg, result_type: "recent").take(1).collect do |tweet|
  		return "#{tweet.user.screen_name}: #{tweet.text}"
	end
end


stocks.each do |stkSym| # loop through stocks
	stock = getStockPrice(stkSym) # get the stock bid ask for each of the tickers
	if (stock)
		twitMsg = twitterSearch("$#{stkSym}")  # get the latest tweet about the stock
		#build your message
		temptext = "The symbol is #{stock.symbol} and the bid - ask is #{stock.bid} -- #{stock.ask}" + twitMsg 
		puts temptext# print your message in terminal
		sendMsg(receivePhone, temptext)	#use twilio to send message to your phone number // change the receive phone number
		tweet(temptext)	 # also tweet the message
	else
		puts "No info found for #{stkSym}"
	end
end







