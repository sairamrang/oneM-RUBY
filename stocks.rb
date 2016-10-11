require 'stock_quote'

def getStockPrice (symbol)
	stockData = StockQuote::Stock.quote(symbol)
	return stockData
end 

stock = getStockPrice("TSLA")
puts " The symbol is #{stock.symbol} and the bid - ask is #{stock.bid} -- #{stock.ask}"
stock = getStockPrice("AAPL")
puts " The symbol is #{stock.symbol} and the bid - ask is #{stock.bid} -- #{stock.ask}"
stock = getStockPrice("TSLA")
puts " The symbol is #{stock.symbol} and the bid - ask is #{stock.bid} -- #{stock.ask}"