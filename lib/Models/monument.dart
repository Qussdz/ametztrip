import 'package:flutter/cupertino.dart';

class Monument {
  final String name;
  final String images;
  final String adresse;
  final String description;

  Monument({
    @required this.name,
    @required this.images,
    this.adresse,
    this.description,
  });
}
