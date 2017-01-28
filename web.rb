require 'sinatra'
require 'stock_quote'

require 'forecast_io'
require 'geocoder'


require "Mechanize"
require "rubygems"
require "Nokogiri"


get '/' do
	@greeting = "Welcome to my first project"
	erb :index
end


post '/stock' do
	@greeting = getStockPrice(params[:symbol])
	erb :new
end

get '/stock' do
	#@greeting = getStockPrice(params[:ticker])
	erb :new
end

get '/stock/' do
	#@greeting = getStockPrice(params[:ticker])
	erb :new
end

get '/stock/:ticker' do
	@greeting = getStockPrice(params[:ticker])
	erb :new
end

def getStockPrice(ticker)

	stock_price = StockQuote::Stock.quote(ticker)
	if (stock_price)
		return "The price of #{ticker} is $#{stock_price.last_trade_price_only}"
	else
		return "No data found"
	end
	raise 'An error has occured'
end 


post '/weather' do
	@weather = getWeather(params[:zip])
	erb :weather
end

get '/weather' do
	erb :weather
end

get '/weather/' do
	erb :weather
end

get '/weather/:zip' do
	@weather = getWeather(params[:zip])
	erb :weather
end


def getWeather(location)
	Geocoder.coordinates(location)
	ForecastIO.api_key = 'a66dc6d80abbe4af0e3660c46381d179' # replace this with your API key
	if (location)
		coordinates = Geocoder.coordinates(location)
		if (coordinates)
			forecast = ForecastIO.forecast(coordinates[0], coordinates[1])
			greetingText = "The weather forecast for the location #{location} is : "
			if (forecast)
				currentForecast = forecast.currently
				return greetingText + "#{currentForecast.summary} and #{currentForecast.temperature} F"
			else
				return "Unable to forecast the weather for this location."
			end
		else
			return "Unable to forecast the weather for this location."
		end
	else
		return "Please enter a valid location."
	end
end


post '/AmazonSearch' do
	@searchResults = getAmazonResults(params[:searchTerm])
	erb :scraper
end

get '/AmazonSearch' do
	erb :scraper
end

get '/AmazonSearch/' do
	erb :scraper
end

get '/AmazonSearch/:searchTerm' do
	@searchResults = getAmazonResults(params[:searchTerm])
	erb :scraper
end


Agent = Mechanize.new
Agent.user_agent_alias = "Mac Safari"
	

def getAmazonResults(searchText)
	if (searchText && searchText.length > 0 )
		page = Agent.get ("http://www.amazon.com")
		search_form = page.form
		
		search_form['field-keywords'] = searchText
		page = search_form.submit
		items = page.css(".s-result-item")
		i = 1
		s = '<table class="table table-bordered table-hover">'
		items.each do |item|
			s << "<tr>"
			if i > 10 then
      			break
   			end
			i += 1
			s << "<td>" + item.css('h2').text + " </td><td>" + item.css('.s-price').text + "</td>" 
			s << "<tr>"
		end # show only the top 10 resuts
		s << "</table>"
		return s
	else
		return "Enter a valid search term. "	
	end

	raise error
end

