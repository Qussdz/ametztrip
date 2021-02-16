import 'package:ametztrip/screens/culture_page.dart';
import 'package:ametztrip/screens/restaurants_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/widgets/customText.dart';
import 'package:ametztrip/widgets/hotels_liste.dart';
import 'package:ametztrip/services/geolocation_services.dart';

class HotelPage extends StatefulWidget {
  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final geoService = GeolocatorService();

  @override
  Widget build(BuildContext context) {
    geoService.getCurrentPosition();
    return Scaffold(
      backgroundColor: grey[50],
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 8.0,
                    ),
                    child: CustomText(
                      text: "Notre selection d'hotels",
                      size: 20,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: grey[400], offset: Offset(1, 1), blurRadius: 4)
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.search, color: black),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Recherchez un hotel",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(Icons.filter_list, color: black),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6, 10, 6, 20),
              child: Hotels(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 51,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HotelPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.restaurant),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RestauPage()));
              },
            ),
            SizedBox(
              width: 40,
            ),
            IconButton(
              icon: Icon(Icons.museum),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CulturePage()));
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        elevation: 15.0,
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
