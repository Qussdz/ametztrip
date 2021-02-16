import 'package:ametztrip/screens/restaurants_details.dart';
import 'package:flutter/material.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/widgets/customText.dart';
import 'package:ametztrip/Models/restaurant.dart';
import 'package:ametztrip/const/navigation.dart';

List<Restaurant> restaurantsList = [
  Restaurant(
      name: "MC Mettis",
      images: "Pizza.jpg",
      adresse: "2 rue du champ\é ",
      like: true,
      categorie: "Halal",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Restaurant(
      name: "Domino's Mettis",
      images: "Pizza.jpg",
      adresse: "2 rue du champ\é ",
      like: false,
      categorie: "Italien",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Restaurant(
      name: "Mettis king",
      images: "Pizza.jpg",
      adresse: "2 rue du champ\é ",
      like: false,
      categorie: "Burger",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
  Restaurant(
      name: "Mettis Hut",
      images: "Pizza.jpg",
      adresse: "2 rue du champ\é ",
      like: true,
      categorie: "Pizza",
      description:
          "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition"),
];

class Vedettes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurantsList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        RDetails(
                          restaurant: restaurantsList[index],
                        ));
                  },
                  child: Container(
                    height: 240,
                    width: 199,
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: grey[500],
                            offset: Offset(1, 1),
                            blurRadius: 4)
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/${restaurantsList[index].images}",
                          height: 135,
                          width: 199,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                    text: "${restaurantsList[index].name}")),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey[600],
                                        offset: Offset(1, 1),
                                        blurRadius: 2.5)
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: restaurantsList[index].like
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.redAccent,
                                          size: 21,
                                        )
                                      : Icon(Icons.favorite_border, size: 21),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CustomText(
                                text: "${restaurantsList[index].categorie}",
                                color: grey[500],
                                size: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
