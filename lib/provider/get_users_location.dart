import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GetUserLocation {
  Future<Position> getCurrentPosition() async {
    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);
    return currentPosition;
  }

  Future<String> getAddressFromLatLng() async {
    var currentAddress;
    try {
      var currentPosition = await getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = placemarks[0];

      currentAddress = place.locality;
      return currentAddress;
    } catch (e) {
      return e.toString();
    }
  }
}
