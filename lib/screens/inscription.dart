import 'package:ametztrip/const/Loading.dart';
import 'package:ametztrip/const/navigation.dart';
import 'package:ametztrip/screens/connexion.dart';
import 'package:ametztrip/providers/auth.dart';
import 'package:ametztrip/const/couleurs.dart';
import 'package:ametztrip/screens/profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey[50],
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        'assets/Mettis Digital.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Center(
                        child: Text(
                          'Créer un compte',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                          controller: authProvider.name,
                          decoration: InputDecoration(
                              labelText: 'Nom complet',
                              border: OutlineInputBorder())),
                      SizedBox(height: 10.0),
                      TextFormField(
                          controller: authProvider.email,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder())),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: authProvider.password,
                        decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            border: OutlineInputBorder()),
                        obscureText: true,
                      ),
                      /*SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Confirmez le mot de passe',
                            border: OutlineInputBorder())),*/
                      SizedBox(height: 10.0),
                      FlatButton(
                          onPressed: () async {
                            if (!await authProvider.signUp()) {
                              _key.currentState.showSnackBar(SnackBar(
                                  content: Text("inscription échouée")));
                              return;
                            }
                            authProvider.clearController();
                            changeScreenReplacement(context, ProfilePage());
                          },
                          color: bleu[900],
                          child: Text('S\'inscrire',
                              style: new TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      OutlineButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Connexion()));
                        },
                        borderSide: BorderSide(width: 1.0, color: Colors.black),
                        child: Text('Avez-vous déjà un compte ?'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
