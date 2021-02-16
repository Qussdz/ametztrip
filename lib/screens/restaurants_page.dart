import 'package:ametztrip/screens/culture_page.dart';
import 'package:ametztrip/screens/hotels_page.dart';
import 'package:ametztrip/widgets/restau_categories.dart';
import 'package:ametztrip/widgets/restau_vedettes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/widgets/customText.dart';
import 'package:ametztrip/widgets/small_button.dart';

class RestauPage extends StatefulWidget {
  @override
  _RestauPageState createState() => _RestauPageState();
}

class _RestauPageState extends State<RestauPage> {
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
                      text: "Une petite faim ?",
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
                        hintText: "Que voulez-vous manger ?",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(Icons.filter_list, color: black),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                bottom: 8.0,
              ),
              child: CustomText(
                text: "En vedette",
                size: 20,
              ),
            ),
            Vedettes(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Populaires",
                size: 20,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(2),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    color: Colors.red.withOpacity(.4),
                                    child: Image.asset("assets/Pizza.jpg"),
                                  )),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 260,
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(.7),
                                      gradient: new LinearGradient(
                                          colors: [
                                            const Color(0xFF3366FF),
                                            const Color(0xFF00CCFF),
                                          ],
                                          begin:
                                              const FractionalOffset(0.0, 0.0),
                                          end: const FractionalOffset(1.0, 0.0),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                  )),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              height: 280,
                              width: MediaQuery.of(context).size.width - 20,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, bottom: 30, top: 10),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SmallButton(Icons.favorite),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Mettis hut \n",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: white)),
                                              TextSpan(
                                                  text: "Pizza",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: white)),
                                            ], style: TextStyle(color: black)),
                                          ),
                                        ],
                                      )
                                    ]),
                              )),
                        ],
                      ),
                    )
                  ],
                ))
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

          //  Navigator.of(context)
          // .push(MaterialPageRoute(builder: (context) => HOme_map()));
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
