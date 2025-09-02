import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' hide LocationAccuracy;

import 'app_settings.dart';

class LocationHandler {
  static bool locationPermissionDeniedForever = false;
  static Position? position;
  static LatLng? currentPosition;
  static geocoding.Placemark? place;

  static Future<Position> determinePosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    locationPermissionDeniedForever = false;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Location().requestService();
      return determinePosition(context);
    }

    while (true) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        locationPermissionDeniedForever = true;

        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const PermissionDeniedDialog(),
        );
      }

      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        position = await Geolocator.getCurrentPosition();
        currentPosition = LatLng(position!.latitude, position!.longitude);
        await getPositionOfUser(context);
        return position!;
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  static getCurrentLatlLong() async {
    return await Geolocator.getCurrentPosition();
  }

  static getPositionOfUser(BuildContext context) async {
    if (position?.latitude != null) {
      List<geocoding.Placemark> placeMarks = await geocoding
          .placemarkFromCoordinates(position!.latitude, position!.longitude);
      place = placeMarks[0];
      print(place);
      return place;
    }
  }

  static Future<String> calculateDistance(
    double? vendorLat,
    double? vendorLng,
  ) async {
    try {
      if (vendorLat == null || vendorLng == null) {
        return "0.0 Km";
      }

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return "Location services are disabled";
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return "Location permission denied";
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return "Location permission permanently denied";
      }
      Position userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );double distanceInMeters = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        vendorLat,
        vendorLng,
      );

      double distanceInKm = distanceInMeters / 1000;

      return "${distanceInKm.toStringAsFixed(2)} km ";
    } catch (e) {
      print("Error in calculateDistance: $e");
      return "Location error";
    }
  }
}

class PermissionDeniedDialog extends StatelessWidget {
  const PermissionDeniedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 30),
        elevation: 20,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_sharp, size: 100, color: Colors.red),
              const SizedBox(height: 24),

              const Text(
                'We Respect Your Privacy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF263238),
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'To serve you better, we kindly request access to your location.\nPlease enable location permissions from settings to continue using location-based features.',

                style: TextStyle(
                  fontSize: 15.5,
                  color: Color(0xFF607D8B),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  AppSettings.openAppSettings();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: const Color(0xFF1976D2),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 6,
                  shadowColor: Colors.blueAccent.withOpacity(0.2),
                ),
                child: const Text(
                  'Open Settings',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
