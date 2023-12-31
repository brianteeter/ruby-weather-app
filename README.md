# Ruby Weather App

## Example Deployment

https://ruby-weather-app-e135fc7a635a.herokuapp.com

## Functionality

This app provides a simple web ui where you can enter an address or location, and once submitted it will return a weather report for said location.

For example, you can enter a traditional address like:

```
1600 Pennsylvania Avenue NW, Washington, DC 20500
```

or you could just enter:

```
The White House
```

and the app will do its best to interpret your location and return the current weather, as well as a 7 day forecast.  If it cannot find the location, or get the weather for that location an error will be displayed.  

## Services Used

This app relies upon Google's Geolocation API and OpenWeather's Weather API.  If you want to
download and use this app, you will need to supply environment variables for the API keys for 
these services.  In development, this is most easily accomplished by using a .env file containing:

```
GOOGLE_GEOLOCATION_API_KEY=<your key here>
OPENWEATHER_API_KEY=<your key here>
```

or by supplying the same named environment variables as you see fit in your environment.

## Caching

The app will cache weather for a locale for up to 30 minutes.  The caching for this app uses specific 
latitude and longitude coordinates for its caching.  

This differs from the initial requested requirements which requested caching using ZIP codes.  The reason for deviating is that international addresses don't always have ZIP codes - but the do always
have latitude and longitude.  A potential weakness of this approach is that a "near" address won't necessarily hit the cache.  For example, two addresses in the same town will have different lat/longs but may have different zip codes.  This could be addressed with geofencing or other techniques but was not addressed in this simple example.


## Note

This is a simple project to fulfill an assignment as part of a coding interview.  It is not meant for reuse or as an example.

