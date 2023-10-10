
class GeolocationAPIService

  def initialize()

  end

  def get_geodata_for_address(address)

    if (address.nil?)
      return nil
    end

    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=1520 Gulf Blvd, Clearwater Beach, FL 33767&key=" + ENV['GOOGLE_GEOLOCATION_API_KEY'])

  end
end