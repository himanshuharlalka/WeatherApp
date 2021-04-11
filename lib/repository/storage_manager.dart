import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/Weather.dart';
import 'package:weather_app/model/geo_position.dart';

class StorageManager {

  static final StorageManager _instance = StorageManager._internal();

  StorageManager._internal();

  factory StorageManager() {
    return _instance;
  }

  Future getUnit() async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      int unit = sharedPreferences.getInt("degree");
      if (unit == null) {
        return 0;
      } else {
        return unit;
      }
    } catch (exc, stackTrace) {

      return 0;
    }
  }

  saveUnit(int unit) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();



      sharedPreferences.setInt("degree", unit);
    } catch (exc, stackTrace) {

    }
  }
  saveLocation(GeoPosition geoPosition) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.setString(
          "location", json.encode(geoPosition));
    } catch (exc, stackTrace) {

    }
  }

  Future<GeoPosition> getLocation() async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      String jsonData = sharedPreferences.getString("location");

      if (jsonData != null) {
        return GeoPosition.fromJson(json.decode(jsonData));
      } else {
        return null;
      }
    } catch (exc, stackTrace) {

      return null;
    }
  }

  saveWeather(Weather response) async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.setString("weather", json.encode(response));
    } catch (exc, stackTrace) {

    }
  }

  Future<Weather> getWeather() async {
    try {
      var sharedPreferences = await SharedPreferences.getInstance();
      String jsonData = sharedPreferences.getString("weather");

      if (jsonData != null) {
        return Weather.fromJson(jsonDecode(jsonData));
      } else {
        return null;
      }
    } catch (exc, stackTrace) {

      return null;
    }
  }
}
class ApplicationLocalRepository {
  final StorageManager _storageManager = StorageManager();

  Future getSavedUnit() async {
    return _storageManager.getUnit();
  }

  void saveUnit(int unit) {
    _storageManager.saveUnit(unit);
  }

}
class WeatherLocalRepository {
  final StorageManager _storageManager = StorageManager();

  static final WeatherLocalRepository _instance =
  WeatherLocalRepository._internal();

  WeatherLocalRepository._internal();

  factory WeatherLocalRepository() {
    return _instance;
  }

  void saveLocation(GeoPosition geoPosition) async {
    await _storageManager.saveLocation(geoPosition);
  }

  Future<GeoPosition> getLocation() async {
    return await _storageManager.getLocation();
  }

  void saveWeather(Weather response) async {
    await _storageManager.saveWeather(response);
  }

  Future<Weather> getWeather() async {
    return await _storageManager.getWeather();
  }


}