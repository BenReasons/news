require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "8ada1ea79ccb1b14962f899ce5000f24"

# do the heavy lifting, use Global Hub lat/long
forecast = ForecastIO.forecast(42.0574063,-87.6722787).to_hash

get "/" do
    # show a view that asks for the location
    view "ask"
end

get "/news" do
    # do everything else
    results = Geocoder.search(params["location"])
    lat_long = results.first.coordinates # => [lat, long]
    lat = "#{lat_long[0]}"
    long = "#{lat_long[1]}"
    "#{lat} #{long}"

    # url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=468f712111694cd8a42245681807ac81"
    # news = HTTParty.get(url).parsed_response.to_hash
    # current_news = news["articles"][3]["description"]
    # "#{current_news}"
end