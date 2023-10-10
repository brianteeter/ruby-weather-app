class HomeController < ApplicationController

  def initialize()

    @geolocation_service = GeolocationAPIService.new
    @openweather_service = OpenWeatherAPIService.new

  end
  def index()

    render "home/index", :layout => 'application'

  end

  def get_weather()

    if (params['address'] == '')

      @alert = "You need to provide an address in order to get a weather report..."

    else

      @address = params['address']

      # ------------------------------------------------------------------------------------
      # Attempt to geolocate whatever was provided.  If successful, we should get a
      # lat/long to use to get weather.  If not, we throw back an error:
      # ------------------------------------------------------------------------------------
      @geolocation_result = @geolocation_service.get_geodata_for_address(params['address'])

      if (@geolocation_result != nil &&
        @geolocation_result['status'] == 'OK' &&
        @geolocation_result['results'][0]['geometry']['location'] != nil)

        # Grab the lat/long:
        lat = @geolocation_result['results'][0]['geometry']['location']['lat']
        long = @geolocation_result['results'][0]['geometry']['location']['lng']

        # if we have a valid lat/long get the current weather report.
        if (lat && long)

          @openweather_result = @openweather_service.get_weather_info_for_latlong(lat, long)

        else

          @alert = "Unable to find weather for the specified location, please try another location... "

        end

      else

        @alert = "Unable to find the specified location, please try another location... "

      end
    end

    render "home/get_weather", :layout => 'application'

  end
end
