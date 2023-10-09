
class GeolocationAPIService

  def initialize()

  end

  def get_geodata_for_address(address)

    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=1520 Gulf Blvd, Clearwater Beach, FL 33767&key=AIzaSyBd_Ibf7Nq8sKJ69QyrTIS6q6T8oR2Vs2k")

  end
end