import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'gymTile.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class GymPage extends StatefulWidget {
  final GymStorage storage;

  GymPage({Key key, @required this.storage}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MapSampleState();
  }
}

class GymStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/counter.txt');
  }

  Future<String> readContent() async {
    // final file = await _localFile;

    // // Read the file
    // String contents = await file.readAsString();
    String content =
        await rootBundle.loadString('assets/EXERCISEFACILITIES.kml');
    print(content.substring(1, 100));
    return content;
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
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

  List allTiles = [];
  @override
  void initState() {
    super.initState();
    widget.storage.readContent().then((String content) {
      setState(() {
        List allgyms = [];
        var document = xml.parse(content);

        var gymName = document.findAllElements('Placemark');
        List gymNames = [];
        for (var gym in gymName) {
          gymNames.add(gym.findAllElements('name').single.text);
          allgyms.add(gym.findAllElements('description'));
        }
        for (int i = 0; i < 152; i++) {
          var firstGym = allgyms[i];
          var firstDescription;
          for (var des in firstGym) {
            firstDescription = des;
          }
          var tables = firstDescription
              .findAllElements('body')
              .single
              .findAllElements('table');
          var secondTable;
          for (var table in tables) {
            secondTable = table;
          }
          var trIter = secondTable.findAllElements('tr');
          List tdList = [];
          for (var tr in trIter) {
            var tdIter = tr.findAllElements('td');
            for (var td in tdIter) {
              tdList.add(td);
            }
          }
          print(i);
          var result = gymTile(
              name: gymNames[i],
              postalCode: tdList[7].text,
              address: tdList[19].text,
              description: tdList[23].text,
              latitude: double.parse(tdList[31].text),
              longitude: double.parse(tdList[33].text));
          // print("start!!!!!");
          // print(firstDescription);
          // print("end!!!");
          // var tableIter = firstDescription.text;
          // print(tableIter);
          allTiles.add(result);
        }
      });
    });
  }

  // static CameraPosition _kWestgate = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(1.334669, 103.743307),
  //     tilt: 59.440717697143555,
  //     zoom: 20);

  // static CameraPosition _kJunction = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(1.385449, 103.760594),
  //     tilt: 59.440717697143555,
  //     zoom: 20);

  // static CameraPosition _kBishan = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(1.369470, 103.850074),
  //     tilt: 59.440717697143555,
  //     zoom: 20);

  MapType _currentMapType = MapType.normal;

  // void _onMapTypeButtonPressed() {
  //   setState(() {
  //     _currentMapType = _currentMapType == MapType.normal
  //         ? MapType.satellite
  //         : MapType.normal;
  //   });
  // }

  // Future<void> _goToWestgate() async {
  //   // final GoogleMapController controller = await _controller.future;
  //   mapController.animateCamera(CameraUpdate.newCameraPosition(_kWestgate));
  // }

  // Future<void> _goToJunction() async {
  //   // final GoogleMapController controller = await _controller.future;
  //   mapController.animateCamera(CameraUpdate.newCameraPosition(_kJunction));
  // }

  // Future<void> _goToBishan() async {
  //   // final GoogleMapController controller = await _controller.future;
  //   mapController.animateCamera(CameraUpdate.newCameraPosition(_kBishan));
  // }

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = LatLng(1.3521, 103.8198);

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  List androidVersionNames = ["Cupcake", "Donut"];
  @override
  Widget build(BuildContext context) {
      ListTile makeListTile(gymTile tile) => ListTile(
            title: Container(
                child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(tile.name),
                ),
                Container(
                  width: 100,
                  child: Text(tile.latitude.toString()),
                )
              ],
            )),
          );

      return new Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: 500,
              child: GoogleMap(
                mapType: _currentMapType,
                initialCameraPosition: _kSingapore,
                // onMapCreated: (GoogleMapController controller) {
                //   // _controller.complete(controller);
                // },
                onMapCreated: _onMapCreated,
                markers: _markers,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              child: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                    itemCount: 152,
                    itemBuilder: (context, index) =>
                        makeListTile(allTiles[index]))),
            //   Align(
            //     alignment: Alignment.topRight,
            //     child: Column(
            //       children: <Widget>[
            //         SizedBox(height: 16.0),
            //         FloatingActionButton.extended(
            //           onPressed: _goToWestgate,
            //           label: Text('Fitness First Westgate'),
            //           icon: Icon(Icons.directions_walk),
            //         ),
            //         SizedBox(height: 16.0),
            //         FloatingActionButton(
            //           onPressed: _onMapTypeButtonPressed,
            //           materialTapTargetSize: MaterialTapTargetSize.padded,
            //           backgroundColor: Colors.green,
            //           child: const Icon(Icons.add_location, size: 36.0),
            //         ),
            //         SizedBox(height: 16.0),
            //         FloatingActionButton(
            //           onPressed: _onAddMarkerButtonPressed,
            //           materialTapTargetSize: MaterialTapTargetSize.padded,
            //           backgroundColor: Colors.green,
            //           child: const Icon(Icons.add_location, size: 36.0),
            //         ),
            //         // SizedBox(height: 16.0),
            //         // FloatingActionButton.extended(
            //         //   onPressed: _goToJunction,
            //         //   label: Text('Fitness First Junction 10!'),
            //         //   icon: Icon(Icons.directions_walk),
            //         // ),
            //         // SizedBox(height: 16.0),
            //         // FloatingActionButton.extended(
            //         //   onPressed: _goToBishan,
            //         //   label: Text('GymBoxx Bishan'),
            //         //   icon: Icon(Icons.directions_walk),
            //         // ),
            //       ],
            //     ),
            //   ),
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: Text('To the lake!'),
        //   icon: Icon(Icons.directions_boat),
        // ),
      );
  }
}

Future<List> getGymTiles() async {
  List allgyms = [];
  var content = await rootBundle.loadString('assests/EXERCISEFACILITIES.kml');
  var document = xml.parse(content);

  var gymName = document.findAllElements('Placemark');
  List gymNames = [];
  for (var gym in gymName) {
    gymNames.add(gym.findAllElements('name').single.text);
    allgyms.add(gym.findAllElements('description'));
  }
  List gymContents = [];
  for (int i = 0; i < 152; i++) {
    var firstGym = allgyms[i];
    var firstDescription;
    for (var des in firstGym) {
      firstDescription = des;
    }
    var tables = firstDescription
        .findAllElements('body')
        .single
        .findAllElements('table');
    var secondTable;
    for (var table in tables) {
      secondTable = table;
    }
    var trIter = secondTable.findAllElements('tr');
    List tdList = [];
    for (var tr in trIter) {
      var tdIter = tr.findAllElements('td');
      for (var td in tdIter) {
        tdList.add(td);
      }
    }
    print(i);
    var result = gymTile(
        name: gymNames[i],
        postalCode: tdList[7].text,
        address: tdList[19].text,
        description: tdList[23].text,
        latitude: double.parse(tdList[31].text),
        longitude: double.parse(tdList[33].text));
    gymContents.add(result);
  }
  return gymContents;
}
// List getGymTiles() {
//   return [gymTile(name: "gymboxx", postalCode: "453543", address: 'sfljdsa', description: 'lsdjfslfa', latitude: 324.32, longitude: 324.32),];
// }
