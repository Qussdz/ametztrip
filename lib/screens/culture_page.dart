import 'package:ametztrip/screens/hotels_page.dart';
import 'package:ametztrip/screens/restaurants_page.dart';
import 'package:ametztrip/widgets/culture_monuments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/widgets/customText.dart';
import 'package:ametztrip/widgets/hotels_liste.dart';

class CulturePage extends StatefulWidget {
  @override
  _CulturePageState createState() => _CulturePageState();
}

class _CulturePageState extends State<CulturePage> {
  @override
  Widget build(BuildContext context) {
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
                      text: "Un peu de culture ...",
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
                        hintText: "Recherchez un lieu",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(Icons.filter_list, color: black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                bottom: 8.0,
              ),
              child: CustomText(
                text: "à visier",
                size: 20,
              ),
            ),
            Monuments(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Actualité",
                size: 20,
              ),
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

          //   Navigator.of(context)
          //   .push(MaterialPageRoute(builder: (context) => HOme_map()));
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
