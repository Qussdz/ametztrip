import 'package:ametztrip/const/couleurs.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _ProfilePageState();

  void showdialog(bool isUpdate, DocumentSnapshot ds) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: bleu[900],
      title: Text(
        "Profil",
        style: TextStyle(
          fontFamily: "tepeno",
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {},
        ),
      ],
    ));
  }
}
