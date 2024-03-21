import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapViewModel {
  Completer<GoogleMapController> controller = Completer();

  Future<LatLng> loadCurrentUserCoordinates() async {
    
    try {
      await _checkGpsEnabled();
    } catch (ex) {
      debugPrint(ex.toString());
      throw Exception('Location services are disabled.');
    }

    Position? position;
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: const Duration(seconds: 5),
      );
    } on TimeoutException catch (ex) {
      debugPrint(ex.toString());
      position = await Geolocator.getLastKnownPosition();
    }

    if (position == null) {
      throw Exception(
        'Location capture failed. You might need to enable internet.',
      );
    }

    return LatLng(position.latitude, position.longitude);
  }

  Future<void> _checkGpsEnabled() async {
    bool serviceEnabled;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      final locationOpened = await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!locationOpened || !serviceEnabled) {
        throw Exception('Location services are disabled.');
      }
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      final openPermSettings = await Geolocator.openAppSettings();
      if (!openPermSettings) {
        throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.',
        );
      }
    }

    if (permission == LocationPermission.unableToDetermine) {
      throw Exception(
        'Unable to determine location permissions. Retry a few seconds later.',
      );
    }
  }
}