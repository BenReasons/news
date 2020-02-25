require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "8ada1ea79ccb1b14962f899ce5000f24"

get "/" do
    # show a view that asks for the location
    view "ask"
end

get "/news" do
    # do everything else
    @location = params["location"]
    results = Geocoder.search(params["location"])
    lat_long = results.first.coordinates
    lat = "#{lat_long[0]}"
    long = "#{lat_long[1]}"
    
    @forecast = ForecastIO.forecast("#{lat}","#{long}").to_hash
    @current_temperature = @forecast["currently"]["temperature"]
    @current_conditions = @forecast["currently"]["summary"]
    @daily_forecast = @forecast["daily"]["data"].slice(0, 5)
    @high_temperature = @forecast["daily"]["data"][0]["temperatureHigh"]

    @url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=468f712111694cd8a42245681807ac81"
    @news = HTTParty.get(@url).parsed_response.to_hash
    @current_news = @news["articles"].slice(0,3)


    view "news"
end