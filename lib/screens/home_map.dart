import 'package:flutter/material.dart';
import 'package:ametztrip/services/geolocation_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import './map.dart';

// ignore: must_be_immutable
class Home_map extends StatefulWidget {
  Position position;
  @override
  _Home_mapState createState() => _Home_mapState();
  Home_map(this.position);
}

// ignore: camel_case_types
class _Home_mapState extends State<Home_map> {
  final geoService = GeolocatorService();
  Position myposition;

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getCurrentPosition(),
      child: Consumer<Position>(
        builder: (context, position, widget) {
          return (position != null)
              ? Map(position)
              : Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
        },
      ),
    );
  }
}
