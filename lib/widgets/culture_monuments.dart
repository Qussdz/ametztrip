import 'package:ametztrip/screens/culture_details.dart';
import 'package:flutter/material.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/widgets/customText.dart';
import 'package:ametztrip/Models/monument.dart';
import 'package:ametztrip/const/navigation.dart';

List<Monument> monumentsList = [
  Monument(
    name: "Cathédrale de Metz",
    images: "Cathe.jpg",
    adresse: "2 rue du champ\é ",
    description:
        "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition",
  ),
  Monument(
    name: "Palais du gouverneur",
    images: "Pgouv.jpg",
    adresse: "2 rue du champ\é ",
    description:
        "test de descrpition test de descrpition test de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition test de descrpition test de de descrpition test de descrpition descrpition",
  ),
];

class Monuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: monumentsList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        MDetails(
                          monument: monumentsList[index],
                        ));
                  },
                  child: Container(
                    height: 240,
                    width: 200,
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: grey[400],
                            offset: Offset(1, 1),
                            blurRadius: 4)
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/${monumentsList[index].images}",
                          height: 135,
                          width: 199,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                    text: "${monumentsList[index].name}")),
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
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: CustomText(
                                text: "${monumentsList[index].adresse}",
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
