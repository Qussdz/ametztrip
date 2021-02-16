import 'dart:async';
import 'dart:ffi';
import 'package:ametztrip/screens/connexion.dart';
import 'package:ametztrip/screens/culture_page.dart';
import 'package:ametztrip/screens/hotels_page.dart';
import 'package:ametztrip/screens/restaurants_page.dart';
import 'package:ametztrip/services/geolocation_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ametztrip/main.dart';

class Map extends StatefulWidget {
  final Position initialPosition;

  Map(this.initialPosition);

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<Map> {
  final GeolocatorService geoService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    geoService.getPositionStream().listen((position) {
      centerScreen(position);
    });
    super.initState();
  }

  // ignore: non_constant_identifier_names
  void position_Finder() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
              padding: EdgeInsets.only(
                top: 660.0,
              ),
              initialCameraPosition: CameraPosition(
                  target: LatLng(widget.initialPosition.longitude,
                      widget.initialPosition.latitude),
                  zoom: 13.0),
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }),
          Positioned(
            top: 65.0,
            right: 15.0,
            left: 15.0,
            child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Votre recherche',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 25.0, top: 15.0),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.account_circle),
                                color: Colors.purpleAccent[700],
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Connexion()));
                                },
                                iconSize: 32.0),
                            prefixIcon: IconButton(
                                icon: Icon(Icons.location_on),
                                color: Colors.purpleAccent[700],
                                onPressed: () {},
                                iconSize: 32.0)),
                      ),
                      flex: 25,
                    ),
                  ],
                )),
          ),
          /* Positioned(
              right: 0.0,
              left: 0.0,
              bottom: -20.0,
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    color: Colors.grey[50].withOpacity(0.90)),
              )),*/
          Positioned(
            right: 15.0,
            left: 15.0,
            bottom: 20.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  gradient: LinearGradient(
                    colors: [Colors.purpleAccent[700], Colors.blue[800]],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.hotel),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HotelPage()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.restaurant),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestauPage()));
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    icon: Icon(Icons.museum),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CulturePage()));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.folder_open),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        elevation: 15.0,
        child: const Icon(
          Icons.home,
          color: Colors.indigo,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // ignore: missing_return
  Future<Void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 13.0)));
  }
}
