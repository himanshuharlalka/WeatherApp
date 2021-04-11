import 'dart:convert';

import 'package:weather_app/model/Weather.dart';
import 'package:http/http.dart' as http;
class WeatherApi{
  Future<Weather> getWeather(double latitude, double longitude) async {
    final response = await http.get("http://api.weatherapi.com/v1/forecast.json?key=bc486fd3a65249f7aee175139211004&q="+latitude.toString()+","+longitude.toString()+"&days=5");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
class WeatherRemoteRepository{
  final weatherApi = WeatherApi();

  static final WeatherRemoteRepository _instance = WeatherRemoteRepository._internal();
  WeatherRemoteRepository._internal();

  factory WeatherRemoteRepository(){
    return _instance;
  }

  Future<Weather> fetchWeather(double latitude,double longitude){
    return weatherApi.getWeather(latitude,longitude);
  }



}