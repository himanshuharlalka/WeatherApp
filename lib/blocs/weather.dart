
import 'package:weather_app/model/Weather.dart';
import 'package:weather_app/model/geo_position.dart';
import 'package:rxdart/rxdart.dart';
import 'base.dart';

class WeatherBloc extends BaseBloc {
  final weatherSubject = BehaviorSubject<Weather>();



  fetchWeatherForUserLocation() async {


    GeoPosition geoPosition = await getPosition();
    if (geoPosition != null) {
      fetchWeather(geoPosition.lat, geoPosition.long);
    }
  }

  fetchWeather(double latitude, double longitude) async {

    Weather weatherResponse =
    await weatherRemoteRepository.fetchWeather(latitude, longitude);
    if (weatherResponse!= null) {
      weatherLocalRepository.saveWeather(weatherResponse);
    } else {

      Weather weatherResponseStorage =
      await weatherLocalRepository.getWeather();
      if (weatherResponseStorage != null) {
        weatherResponse = weatherResponseStorage;
      }
    }

    weatherSubject.sink.add(weatherResponse);
  }



  dispose() {

    weatherSubject.close();
  }

}

final bloc = WeatherBloc();