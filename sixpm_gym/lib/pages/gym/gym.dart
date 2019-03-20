import 'package:flutter/material.dart';
import '../widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class GymPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MapSampleState();
  }
}

class MapSampleState extends State<GymPage> {
  // Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static CameraPosition _kSingapore = CameraPosition(
    target: LatLng(1.3521, 103.8198),
    zoom: 10,
  );

  static CameraPosition _kWestgate = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(1.334669, 103.743307),
      tilt: 59.440717697143555,
      zoom: 20);

  static CameraPosition _kJunction = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(1.385449, 103.760594),
      tilt: 59.440717697143555,
      zoom: 20);

  static CameraPosition _kBishan = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(1.369470, 103.850074),
      tilt: 59.440717697143555,
      zoom: 20);

  // MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kSingapore,
            // onMapCreated: (GoogleMapController controller) {
            //   // _controller.complete(controller);
            // },
            onMapCreated: _onMapCreated,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                FloatingActionButton.extended(
                  onPressed: _goToWestgate,
                  label: Text('Fitness First Westgate'),
                  icon: Icon(Icons.directions_walk),
                ),
                SizedBox(height: 16.0),
                // FloatingActionButton(
                //   onPressed: _onAddMarkerButtonPressed,
                //   materialTapTargetSize: MaterialTapTargetSize.padded,
                //   backgroundColor: Colors.green,
                //   child: const Icon(Icons.add_location, size: 36.0),
                // ),
                FloatingActionButton.extended(
                  onPressed: _goToJunction,
                  label: Text('Fitness First Junction 10!'),
                  icon: Icon(Icons.directions_walk),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton.extended(
                  onPressed: _goToBishan,
                  label: Text('GymBoxx Bishan'),
                  icon: Icon(Icons.directions_walk),
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToWestgate() async {
    // final GoogleMapController controller = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(_kWestgate));
  }

  Future<void> _goToJunction() async {
    // final GoogleMapController controller = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(_kJunction));
  }

  Future<void> _goToBishan() async {
    // final GoogleMapController controller = await _controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(_kBishan));
  }
}

// class _GymPageState extends State<GymPage> {
//   GoogleMapController mapController;

//   final LatLng _center = const LatLng(45.521563, -122.677433);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           options: GoogleMapOptions(
//             cameraPosition: CameraPosition(
//               target: _center,
//               zoom: 11.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
