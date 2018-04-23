# Weather App

# require Ruby Gem
require "barometer"

# ask user for location
puts "What is your location?"
location = gets.chomp.to_s


# *********** get barometer info **************
barometer = Barometer.new(location)
weather = barometer.measure
current_temp = weather.current.temperature.f

# sets today and tomorrow
today = Time.now.strftime("%a").to_i
tomorrow = today + 1

# current weather for given location
puts "Current weather in #{location.upcase} is #{current_temp} degrees."
puts "Your weekday day forecast is: "

# loop through each weekday for forecast
weather.forecast.each do |forecast|
  day = forecast.starts_at.day

  if day == tomorrow
    day_name = "Tomorrow"
  else
    day_name = forecast.starts_at.strftime("%A")
  end

  # displays weather with weekday name
  puts "#{day_name} : The weather will be #{forecast.icon} with a high of #{forecast.high.f} and a low of #{forecast.low.f}."

  # displays weather with date as month and day
  # puts forecast.starts_at.month.to_s + "/" + forecast.starts_at.day.to_s + " is going to be " + forecast.icon + " with a low of " + forecast.low.f.to_s + " and a high of " + forecast.high.f.to_s
end





# ***********  use this for current temp **************
# current temperature per location
# def find_location(location)
#   barometer = Barometer.new(location)
#   weather = barometer.measure
#   current_temp = weather.current.temperature.f
#
#   if current_temp == "84"
#     puts "It's #{current_temp} and very sunny!"
#   elsif current_temp == "55"
#     puts "It's #{current_temp} and very cloudy!"
#   elsif current_temp == "50"
#     puts "It's #{current_temp} and very cold!"
#   elsif current_temp == "60"
#     puts "It's #{current_temp} and very rainy!"
#   elsif current_temp == "32"
#     puts "It's #{current_temp} and very snowy!"
#   else
#     puts "It's #{current_temp}! Enjoy your day!"
#   end
# end
#
# find_location(location)
