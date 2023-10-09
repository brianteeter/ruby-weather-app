
class GeolocationAPIService

  def initialize()

  end

  def get_geodata_for_address(address)

    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=1520 Gulf Blvd, Clearwater Beach, FL 33767&key=" + ENV['GOOGLE_GEOLOCATION_API_KEY'])

  end
end