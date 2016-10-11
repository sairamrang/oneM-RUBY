
require 'forecast_io'
require 'geocoder'

Geocoder.coordinates("1454 S Peoria street, Chicago, IL")
ForecastIO.api_key = 'e326ff277597a7bac3be28c75ff9c5ec' # replace this with your API key

forecast = ForecastIO.forecast(40.7128, -74.0059) 
puts forecast 
puts "forecast.latitude is #{forecast.latitude}"
puts "forecast.longitude is #{forecast.longitude}"

#puts "#{forecast.summary} and #{forecast.temperature} in New York City"