import 'package:geolocator/geolocator.dart';
import 'optional.dart';

class LocationManager {
  Position _lastPosition;

  static final LocationManager _instance = LocationManager._internal();
  LocationManager._internal();

  factory LocationManager(){
    return _instance;
  }

  Future<Optional<Position>> getLocation() async {
    try {
      if (_lastPosition != null) {
        return Optional.of(_lastPosition);
      }
      Position positionSelected = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _lastPosition = positionSelected;
      return Optional.of(_lastPosition);
    } catch (exc, stackTrace) {
      return Optional.absent();
    }
  }
}