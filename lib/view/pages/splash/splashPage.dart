import 'package:enayas_app/services/helpers/checkUserAuth.dart';
import 'package:enayas_app/services/helpers/reloadAllData.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  getCurrentLocation() async {
    Position position = await getGeoLocationPosition();
    location = '${position.latitude},${position.longitude}';
    getAddressFromLatLong(position);
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReloadAllData.reloadAllData();
    checkUserAuth();
    return Scaffold(
      body: Center(
        child: Container(
          // color: AppColors.pink,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/logo.png',
            width: Get.width,
          ),
        ),
      ),
    );
  }
}

String location = '';
var address = RxString('');

Future<void> getAddressFromLatLong(Position position) async {
  address.value = '';
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  print(placemarks);
  Placemark place = placemarks[0];
  address.value = '${place.subLocality}, ${place.locality}';
  // '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
}

Future<Position> getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
