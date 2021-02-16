import 'package:flutter/cupertino.dart';

class Actu {
  final String name;
  final String images;
  final String adresse;
  final String description;

  Actu({
    @required this.name,
    @required this.images,
    this.adresse,
    this.description,
  });
}
