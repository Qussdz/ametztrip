import 'package:flutter/cupertino.dart';

class Restaurant {
  final String name;
  final String images;
  final String adresse;
  final String categorie;
  final bool like;
  final String description;

  Restaurant({
    @required this.name,
    @required this.images,
    this.adresse,
    this.like,
    this.categorie,
    this.description,
  });
}
