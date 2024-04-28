import 'package:flutter/material.dart';
import 'google_map_view_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final Future<LatLng> _mapLoadedFuture;
  final viewModel = GoogleMapViewModel();
  String? cityName;
  TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _mapLoadedFuture = viewModel.loadCurrentUserCoordinates();
  }

  Future<void> fetchCityName(LatLng coordinates) async {
    try {
      final addresses = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );

      if (addresses.isNotEmpty) {
        final firstAddress = addresses.first;
        setState(() {
          cityName = firstAddress.locality ?? "Unknown City";
        });
      } else {
        setState(() {
          cityName = "Unknown City";
        });
      }
    } catch (e) {
      setState(() {
        cityName = "Unknown City";
      });
    }
  }

  Future<void> _searchLocation(String location) async {
    if (location.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(location);
        if (locations.isNotEmpty) {
          Location userLocation = locations.first;
          LatLng coordinates = LatLng(userLocation.latitude, userLocation.longitude);
          fetchCityName(coordinates);
          viewModel.controller.future.then((controller) {
            controller.animateCamera(CameraUpdate.newLatLngZoom(coordinates, 18));
          });
        }
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _locationController,
          decoration: InputDecoration(
            hintText: 'Search Location',
            border: InputBorder.none,
          ),
          onSubmitted: _searchLocation,
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: _mapLoadedFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              }

              fetchCityName(snapshot.data as LatLng);

              return GoogleMapWidget(
                currentUserLocation: snapshot.data as LatLng,
                onMapCreated: (controller) {
                  viewModel.controller.complete(controller);
                },
              );
            },
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () async {
                LatLng currentLocation = await viewModel.loadCurrentUserCoordinates();
                fetchCityName(currentLocation);
                viewModel.controller.future.then((controller) {
                  controller.animateCamera(CameraUpdate.newLatLngZoom(currentLocation, 18));
                });
              },
              child: Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({
    required this.onMapCreated,
    required this.currentUserLocation,
    super.key,
  });

  final void Function(GoogleMapController) onMapCreated;
  final LatLng currentUserLocation;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: currentUserLocation,
        zoom: 18,
      ),
      onMapCreated: onMapCreated,
      markers: {
        Marker(
          markerId: const MarkerId('current_location'),
          position: currentUserLocation,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => MarkerCoordinatesDialog(
                latitude: currentUserLocation.latitude,
                longitude: currentUserLocation.longitude,
              ),
            );
          },
        ),
      },
    );
  }
}

class MarkerCoordinatesDialog extends StatelessWidget {
  const MarkerCoordinatesDialog({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude, longitude;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("User's Current Location"),
      content: Text(
        'Latitude: $latitude, Longitude: $longitude',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
