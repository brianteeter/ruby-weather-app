require "test_helper"

class TestOpenWeatherAPIService < ActionDispatch::IntegrationTest

  test "get weather at the London Tower" do

    openweather_service = OpenWeatherAPIService.new

    result = openweather_service.get_weather_info_for_latlong(51.50811239999999,-0.0759493)

    assert (result != nil)
    assert (result['current'] != nil)

  end

  test "get weather in Clearwater" do

    openweather_service = OpenWeatherAPIService.new

    result = openweather_service.get_weather_info_for_latlong(27.965853, -82.800102)

    assert (result != nil)
    assert (result['current'] != nil)

  end


end
