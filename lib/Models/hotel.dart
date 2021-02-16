import 'package:flutter/cupertino.dart';

class Hotel {
  final String name;
  final String images;
  final String adresse;
  final String ville;
  final String note;
  final bool like;
  final String description;

  Hotel({
    @required this.name,
    @required this.images,
    this.adresse,
    this.ville,
    this.like,
    this.note,
    this.description,
  });
}
