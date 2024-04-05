import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late GoogleMapController? mapController; // Haz que mapController sea nullable

  final LatLng _center = const LatLng(37.42796133580664, -122.085749655962);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    if (mapController == null) return; // Verificar si mapController es nulo

    // Verificar si los servicios de ubicación están activados
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están activados, mostrar un mensaje al usuario
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // El usuario negó el acceso a la ubicación, mostrar un mensaje al usuario
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // El usuario negó permanentemente el acceso a la ubicación, mostrar un mensaje al usuario
      return;
    }

    // Obtener la ubicación actual del dispositivo
    Position position = await Geolocator.getCurrentPosition();
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    mapController!.animateCamera(CameraUpdate.newLatLng(currentLocation));
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _getCurrentLocation(); // Llamar a _getCurrentLocation después de que mapController se haya inicializado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[700],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            myLocationEnabled: true, // Habilita el botón para ir a la ubicación del usuario
            myLocationButtonEnabled: true, // Muestra el botón para ir a la ubicación del usuario
            zoomControlsEnabled: false, // Deshabilita los controles de zoom predeterminados
          ),
          Positioned(
            top: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _getCurrentLocation,
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
