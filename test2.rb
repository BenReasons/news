require "forecast_io"

# configure the Dark Sky API with your API key
ForecastIO.api_key = "8ada1ea79ccb1b14962f899ce5000f24"

# do the heavy lifting, use Global Hub lat/long
@forecast = ForecastIO.forecast(42.0574063,-87.6722787).to_hash

# pp = pretty print
# use instead of `puts` to make reading a hash a lot easier
# e.g. `pp forecast`
# current_temperature = forecast["currently"]["temperature"]
# conditions = forecast["currently"]["summary"]
# puts "In Evanston, it is currently #{current_temperature} and #{conditions}"
# high_temperature = forecast["daily"]["data"][0]["temperatureHigh"]
# puts high_temperature
# puts forecast["daily"]["data"][1]["temperatureHigh"]
# puts forecast["daily"]["data"][2]["temperatureHigh"]

@day = @forecast["daily"]["data"][0]["time"]
@day1 = Time.at(@day).strftime("%a")

@day_time_base = @forecast["daily"]["data"][0]["time"]
@day_time = Time.at(@day_time_base).strftime("%a").slice(0, 5)

pp @day_time