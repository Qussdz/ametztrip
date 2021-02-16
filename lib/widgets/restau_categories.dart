import 'package:flutter/material.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/widgets/customText.dart';
import 'package:ametztrip/Models/restau_category.dart';

List<RCategory> categoriesList = [
  RCategory(name: "Fast-food", image: "Couscous.jpg"),
  RCategory(name: "Italien", image: "Couscous.jpg"),
  RCategory(name: "Asiatique", image: "Couscous.jpg"),
  RCategory(name: "Pizza", image: "Couscous.jpg"),
  RCategory(name: "Oriental", image: "Couscous.jpg"),
  RCategory(name: "Desserts", image: "Couscous.jpg"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: grey[300],
                          offset: Offset(5, 6),
                          blurRadius: 20),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Image.asset(
                      "assets/${categoriesList[index].image}",
                      width: 70,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: categoriesList[index].name,
                  size: 14,
                  color: black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
