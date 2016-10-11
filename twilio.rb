require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'stock_quote'
require 'twitter'


def getStockPrice (symbol)
	stockData = StockQuote::Stock.quote(symbol)
	return stockData
end 



account_sid = 'ACefa5598e8fab15ccaaa582119f8fd2d5'
auth_token = '4cc250ee8cfe552381dc163e970a3705'
@client = Twilio::REST::Client.new account_sid, auth_token
tempphone ="+17736284972"
@SendPhone = "+17088872036"

stocks = ["AAPL", "CSCO", "TSLA", "MSFT", "COF"]

def sendMsg(phone, fText)
	# Global params

	@client.messages.create(
	  from: @SendPhone,
	  to: phone,
	  body: fText
	)
	sleep 1

end

stocks.each do |stkSym|
	stock = getStockPrice(stkSym)
	temptext = "#{stock.symbol} bid - ask is #{stock.bid} - #{stock.ask} "
	sendMsg(tempphone, temptext)	
	puts temptext
end



