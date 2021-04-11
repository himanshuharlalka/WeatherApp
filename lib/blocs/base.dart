import 'package:flutter/cupertino.dart';

import 'package:weather_app/data/weather_api.dart';
import 'package:weather_app/model/geo_position.dart';
import 'package:weather_app/repository/storage_manager.dart';
import 'package:weather_app/utils/location_manager.dart';

abstract class BaseBloc {
  @protected
  final weatherRemoteRepository = WeatherRemoteRepository();
  @protected
  final weatherLocalRepository = WeatherLocalRepository();
  @protected
  final locationManager = LocationManager();

  Future<GeoPosition> getPosition() async {
    try {
      var positionOptional = await locationManager.getLocation();
      if (positionOptional.isPresent) {

        var position = positionOptional.value;
        GeoPosition geoPosition = GeoPosition.fromPosition(position);
        weatherLocalRepository.saveLocation(geoPosition);
        return geoPosition;
      } else {

        return weatherLocalRepository.getLocation();
      }
    } catch (exc, stackTrace) {

      return null;
    }
  }
  void dispose();
}