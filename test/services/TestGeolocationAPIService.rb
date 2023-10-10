require "test_helper"

class TestGeolocationAPIService < ActionDispatch::IntegrationTest


  test "the truth" do
    assert true
  end

  # Ensure a bad location fails:
  test "bad location fails" do

    geolocation_service = GeolocationAPIService.new

    result = geolocation_service.get_geodata_for_address("abc123")

    assert (result != nil)
    assert(result['status'] == "ZERO_RESULTS")

  end

  # Ensure an empty address or location fails:
  test "empty address fails" do

    geolocation_service = GeolocationAPIService.new

    result = geolocation_service.get_geodata_for_address(" ")

    assert (result != nil)
    assert(result['status'] == "ZERO_RESULTS")

  end

  # Ensure a good address works:
  test "good address works" do

    geolocation_service = GeolocationAPIService.new

    result = geolocation_service.get_geodata_for_address("1520 Gulf Blvd, Clearwater, FL 33767")

    assert (result != nil)
    assert(result['status'] == "OK")

  end

  # Ensure a good location works:
  test "good location works" do

    geolocation_service = GeolocationAPIService.new

    result = geolocation_service.get_geodata_for_address("Tropicana Field")

    assert (result != nil)
    assert(result['status'] == "OK")

  end
end
