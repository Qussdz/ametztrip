import 'package:ametztrip/Models/hotel.dart';
import 'package:ametztrip/const/navigation.dart';
import 'package:flutter/material.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/screens/hotels_details.dart';

List<Hotel> hotelsList = [
  Hotel(
      name: "Hotel Mettis",
      images: "hotel.jpg",
      adresse: "2 rue du champ\é ",
      like: true,
      ville: "Metz",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Hotel(
      name: "Mettis Palace",
      images: "hotel.jpg",
      adresse: "2 rue du champ\é ",
      like: false,
      ville: "Nancy",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Hotel(
      name: "Hotel Lafrad",
      images: "hotel.jpg",
      adresse: "2 rue du champ\é ",
      like: false,
      ville: "Metz",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Hotel(
      name: "Hotel Lafrad",
      images: "hotel.jpg",
      adresse: "2 rue du champ\é ",
      like: false,
      ville: "Metz",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Hotel(
      name: "Hotel Lafrad",
      images: "hotel.jpg",
      adresse: "2 rue du champ\é ",
      like: false,
      ville: "Metz",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Hotel(
      name: "Hotel Lafrad",
      images: "hotel.jpg",
      adresse: "2 rue du champ\é ",
      like: false,
      ville: "Metz",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Hotel(
      name: "Hotel Lafrad dfiufbiezbg",
      images: "hotel.jpg",
      adresse: "2 rue du champasdfa\é ",
      like: false,
      ville: "Metzfghredhjerdh",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
];

class Hotels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: hotelsList.length,
            padding: const EdgeInsets.only(bottom: 70),
            itemBuilder: (_, index) {
              return Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                      onTap: () {
                        changeScreen(
                            _,
                            HDetails(
                              hotel: hotelsList[index],
                            ));
                      },
                      child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  color: grey[500],
                                  offset: Offset(3, 3),
                                  blurRadius: 8),
                            ],
                          ),
                          child: Row(children: <Widget>[
                            Image.asset(
                              "assets/${hotelsList[index].images}",
                              height: 200,
                              width: 160,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 24, 16, 6),
                                        child: Container(
                                          width: 180,
                                          child: Text(
                                              hotelsList[index].name.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: black,
                                                fontSize: 20,
                                              )),
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Icon(Icons.location_on,
                                                color: Colors.grey, size: 16)),
                                        Container(
                                          width: 50,
                                          child: Text(
                                            hotelsList[index].ville.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Icon(Icons.star,
                                            color: Colors.amber, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.amber, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.amber, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.amber, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.amber, size: 16),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]))));
            }));
  }
}
