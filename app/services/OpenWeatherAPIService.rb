class OpenWeatherAPIService

  API_BASE_URL = "https://api.openweathermap.org/data/3.0/onecall?"

  def initialize()

  end

  # ------------------------------------------------------------------------------------
  # This is a very simple method to call the open weather service to get weather
  # for a particular lat/long:
  # ------------------------------------------------------------------------------------
  def get_weather_info_for_latlong(lat, long)

    if (lat.nil? or long.nil?)
      return nil
    end

    # ------------------------------------------------------------------------------------
    # We are doing a SUPER simple caching method for data in this service.  We concat
    # the lat + _ + long in a string as a key.  If we find that, and the data is valid as
    # of the last 30 minutes, we reuse it.  If not we pull again and store for future use.
    #
    # Note: The cache is configured to drop entries after 30 mins.
    # ------------------------------------------------------------------------------------
    cache_key = lat.to_s + "_" + long.to_s
    cache_result = Rails.cache.read(cache_key)

    if (cache_result != nil)

      response = cache_result

    else

      request_url = API_BASE_URL + "lat=" + lat.to_s + "&lon=" + long.to_s + "&appid=" + ENV['OPENWEATHER_API_KEY'] + "&units=imperial"
      response = HTTParty.get(request_url)

      # Store this result in the cache for reuse, if appropriate:
      Rails.cache.write(cache_key, response)

    end

    return response

  end

end