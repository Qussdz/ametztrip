import 'package:flutter/material.dart';
import 'package:ametztrip/const/couleurs.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextDecoration decoration;

  CustomText(
      {@required this.text,
      this.size,
      this.color,
      this.weight,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: size ?? 18,
            color: color ?? black,
            fontWeight: weight ?? FontWeight.normal,
            decoration: decoration ?? TextDecoration.none));
  }
}
