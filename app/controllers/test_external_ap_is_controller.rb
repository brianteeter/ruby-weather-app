
class TestExternalApIsController < ApplicationController


  def test_geoapi_api

    geolocation_service = GeolocationAPIService.new
    response = geolocation_service.get_geodata_for_address("1520 Gulf Blvd, Clearwater, FL 33767")
    render json: response

  end

end
