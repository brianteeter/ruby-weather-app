class OpenWeatherAPIService

  API_BASE_URL = "https://api.openweathermap.org/data/3.0/onecall?"

  def initialize()

  end

  # This is a very simple method to call the open weather service to get weather
  # for a particular lat/long
  def get_weather_info_for_latlong(lat, long)

    if (lat.nil? or long.nil?)
      return nil
    end

    request_url = API_BASE_URL + "lat=" + lat.to_s + "&lon=" + long.to_s + "&appid=" + ENV['OPENWEATHER_API_KEY'] + "&units=imperial"
    response = HTTParty.get(request_url)

  end

end