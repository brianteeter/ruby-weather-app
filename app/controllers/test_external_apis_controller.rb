
class TestExternalApisController < ApplicationController

  def initialize()

    @geolocation_service = GeolocationAPIService.new
    @openweather_service = OpenWeatherAPIService.new

  end

  # Super primitive way to test that the external Google geolocation api is working.
  def test_geolocation_api

    response = @geolocation_service.get_geodata_for_address("1520 Gulf Blvd, Clearwater, FL 33767")
    render json: response

  end

  # Another super primitive test of the external OpenWeather API
  def test_openweather_api

    response = @openweather_service.get_weather_info_for_latlong(27.965853, -82.800102)
    render json: response

  end
end
