import 'package:ametztrip/Models/monument.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/widgets/customText.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class MDetails extends StatefulWidget {
  final Monument monument;

  MDetails({@required this.monument});

  @override
  _MDetailsState createState() => _MDetailsState();
}

class _MDetailsState extends State<MDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      AssetImage('assets/${widget.monument.images}'),
                      AssetImage('assets/${widget.monument.images}'),
                      AssetImage('assets/${widget.monument.images}'),
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: redAccent,
                    dotIncreaseSize: 1.5,
                    autoplay: false,
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: white,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Positioned(
                    right: 14,
                    bottom: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: grey[800],
                              offset: Offset(2, 1),
                              blurRadius: 3,
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 6.0),
                  child: CustomText(
                    text: widget.monument.name,
                    size: 26,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                  child: CustomText(
                    text: widget.monument.adresse,
                    size: 18,
                    weight: FontWeight.w600,
                    color: grey[700],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: redAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 6, 28, 6),
                      child: CustomText(
                        text: "Itinéraire",
                        color: white,
                        size: 24,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    top: 20.0,
                  ),
                  child: CustomText(
                    text: "DETAILS",
                    size: 20,
                    color: redAccent,
                    weight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 10.0,
                  right: 30.0,
                ),
                child: CustomText(
                  text: widget.monument.description,
                  size: 18,
                  weight: FontWeight.w600,
                  color: grey[900],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
