import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<Position> getLastKnownPosition({
    bool forceAndroidLocationManager = false,
  }) =>
      Geolocator.getLastKnownPosition(
          forceAndroidLocationManager: forceAndroidLocationManager);

  Future<Position> getCurrentPosition({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
    bool forceAndroidLocationManager = false,
    Duration timeLimit,
  }) =>
      Geolocator.getCurrentPosition(
        desiredAccuracy: desiredAccuracy,
        forceAndroidLocationManager: forceAndroidLocationManager,
        timeLimit: timeLimit,
      );

  Stream<Position> getPositionStream({
    LocationAccuracy desiredAccuracy = LocationAccuracy.best,
    int distanceFilter = 10,
    bool forceAndroidLocationManager = false,
    int timeInterval = 0,
    Duration timeLimit,
  }) =>
      Geolocator.getPositionStream(
        desiredAccuracy: desiredAccuracy,
        distanceFilter: distanceFilter,
        forceAndroidLocationManager: forceAndroidLocationManager,
        // ignore: deprecated_member_use
        timeInterval: timeInterval,
        timeLimit: timeLimit,
      );
}
